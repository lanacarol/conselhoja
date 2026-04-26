import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'advice_service.dart';
import 'translation_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConselhoJá',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatefulWidget {
  const AdvicePage({super.key});

  @override
  State<AdvicePage> createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  final AdviceService _adviceService = AdviceService();
  final TranslationService _translationService = TranslationService();

  String advice = 'Clique em "Novo conselho" para começar.';
  String originalAdvice = '';
  bool isLoading = false;
  bool isTranslating = false;

  Future<void> fetchNewAdvice() async {
    setState(() {
      isLoading = true;
    });

    try {
      final newAdvice = await _adviceService.fetchAdvice();

      setState(() {
        advice = newAdvice;
        originalAdvice = newAdvice;
      });
    } catch (e) {
      setState(() {
        advice = 'Erro ao buscar conselho.';
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> translateAdvice() async {
    if (originalAdvice.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Busque um conselho antes de traduzir.')),
      );
      return;
    }

    setState(() {
      isTranslating = true;
    });

    try {
      final translated =
          await _translationService.translateToPortuguese(originalAdvice);

      setState(() {
        advice = translated;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao traduzir conselho.')),
      );
    }

    setState(() {
      isTranslating = false;
    });
  }

  Future<void> saveAdvice() async {
    if (advice == 'Clique em "Novo conselho" para começar.' ||
        advice == 'Erro ao buscar conselho.') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Busque um conselho válido antes de salvar.')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('conselhos').add({
        'texto': advice,
        'original': originalAdvice,
        'data': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Conselho salvo no Firebase!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar: $e')),
      );
    }
  }

  Future<void> showSavedAdvices() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('conselhos')
          .orderBy('data', descending: true)
          .get();

      final docs = snapshot.docs;

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Conselhos salvos'),
          content: SizedBox(
            width: double.maxFinite,
            child: docs.isEmpty
                ? const Text('Nenhum conselho salvo ainda.')
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(
                          Icons.favorite,
                          color: Colors.deepPurple,
                        ),
                        title: Text(docs[index]['texto']),
                      );
                    },
                  ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fechar'),
            ),
          ],
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar conselhos: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3ECFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'ConselhoJá',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Receba, traduza e salve conselhos favoritos',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(26),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.15),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.lightbulb,
                        size: 70,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 24),
                    isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            advice,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 21,
                              height: 1.4,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: fetchNewAdvice,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Novo conselho'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: isTranslating ? null : translateAdvice,
                  icon: const Icon(Icons.translate),
                  label: Text(
                      isTranslating ? 'Traduzindo...' : 'Traduzir conselho'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: saveAdvice,
                  icon: const Icon(Icons.save),
                  label: const Text('Salvar no Firebase'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: showSavedAdvices,
                  icon: const Icon(Icons.list),
                  label: const Text('Ver conselhos salvos'),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
