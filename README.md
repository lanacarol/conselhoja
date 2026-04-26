# ConselhoJá 💡

## 📌 Sobre o projeto

**ConselhoJá** é uma aplicação mobile desenvolvida em **Flutter** com o objetivo de exibir conselhos aleatórios de forma rápida, simples e interativa.

O aplicativo consome uma API externa para buscar conselhos em tempo real, permite traduzir os textos para português e também salvar os conselhos favoritos utilizando **Firebase Firestore**, garantindo persistência em nuvem.

Este projeto foi desenvolvido como **trabalho individual acadêmico**, atendendo aos requisitos de:

- desenvolvimento em Flutter;
- consumo de API externa;
- integração com Firebase;
- código versionado no GitHub;
- README com documentação do projeto;
- APK para testes no celular.

---

## 🎯 Objetivo

O objetivo do aplicativo é oferecer uma experiência simples e funcional para receber conselhos aleatórios, traduzir para português e armazenar os favoritos em nuvem.

---

## 🚀 Funcionalidades

- Buscar conselhos aleatórios por meio de API
- Exibir o conselho na tela principal
- Traduzir o conselho do inglês para português
- Salvar conselhos favoritos no Firebase Firestore
- Visualizar conselhos salvos
- Persistência de dados em nuvem
- Funcionamento em diferentes dispositivos (web e APK)

---

## 🛠️ Tecnologias utilizadas

- Flutter
- Dart
- HTTP
- Firebase Core
- Cloud Firestore
- FlutLab
- Advice Slip API
- MyMemory Translation API

---

## 🌐 APIs utilizadas

### 1. Advice Slip API
Responsável por fornecer conselhos aleatórios.

**Endpoint utilizado:**  
https://api.adviceslip.com/advice

### 2. MyMemory Translation API
Responsável por traduzir o conselho do inglês para português.

**Exemplo de uso:**  
https://api.mymemory.translated.net/get?q=TEXT&langpair=en|pt-br

---

## 🔥 Integração com Firebase

O projeto utiliza **Firebase Firestore** para armazenar os conselhos favoritos do usuário em nuvem.

### Funcionalidades com Firebase

- salvar conselhos traduzidos ou originais;
- manter os dados persistidos online;
- acessar os mesmos dados em diferentes dispositivos;
- visualizar os conselhos já salvos.

### Coleção utilizada no Firestore

- `conselhos`

### Campos salvos

- `texto`
- `original`
- `data`

---

## 📱 Interface do aplicativo

---

## 📸 Prints do aplicativo

### Página inicial
![Página inicial](assets/images/paginicial.jpeg)

### Exibição de conselho
![Exibição de conselho](assets/images/frase.jpeg)

### Conselho traduzido
![Conselho traduzido](assets/images/traduzido.jpeg)

### Conselho salvo no Firebase
![Conselho salvo no Firebase](assets/images/salvonofire.jpeg)

### Tela de conselhos salvos
![Tela de conselhos salvos](assets/images/conselhossalvos.jpeg)

A aplicação possui:

- tela principal com layout moderno;
- cartão central para exibição do conselho;
- botão para gerar novo conselho;
- botão para traduzir o conselho;
- botão para salvar no Firebase;
- botão para visualizar os conselhos salvos.

---

## 📂 Estrutura do projeto

- `lib/main.dart`
- `lib/advice_service.dart`
- `lib/translation_service.dart`
- `lib/firebase_options.dart`

### Descrição dos arquivos

- `main.dart` → interface principal do app, botões e integração com Firebase
- `advice_service.dart` → responsável por consumir a API de conselhos
- `translation_service.dart` → responsável por consumir a API de tradução
- `firebase_options.dart` → arquivo gerado pela configuração do Firebase no Flutter

---

## 🧱 Arquitetura da aplicação

A aplicação foi organizada em **três partes principais**:

### 1. Interface (UI)
Responsável por exibir os dados na tela e receber as ações do usuário.

### 2. Serviços (APIs)
Responsável por consumir as APIs externas:

- Advice Slip API
- MyMemory Translation API

### 3. Persistência em Nuvem (Firebase Firestore)
Responsável por armazenar e recuperar os conselhos salvos.

---

## 🔄 Fluxo de funcionamento

1. O usuário abre o aplicativo  
2. Clica em **Novo conselho**  
3. O app consome a **Advice Slip API**  
4. O conselho é exibido na tela  
5. O usuário pode clicar em **Traduzir conselho**  
6. O app consome a **MyMemory Translation API**  
7. O usuário pode clicar em **Salvar no Firebase**  
8. O conselho é salvo na coleção **conselhos** no Firestore  
9. O usuário pode clicar em **Ver conselhos salvos**

---

## ▶️ Como testar o aplicativo

Para testar o aplicativo, basta baixar e instalar o APK disponibilizado no link abaixo.

### APK para Android

[Baixar APK](https://na01.safelinks.protection.outlook.com/?url=https://api.flutlab.io/projects/3370183/download-app?key=zrgcsop4wksctkvybl2j&target=android-arm64&data=05|02||d63e58d3cd5340c69b9e08dea3cdd2b4|84df9e7fe9f640afb435aaaaaaaaaaaa|1|0|639128301551360139|Unknown|TWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ==|0|||&sdata=uR71m/jFGDpO4Jm+3pUIpF3TBB08yaFBZvG5bqM/aY0=&reserved=0)

### Como instalar

1. Baixe o arquivo APK no celular Android.  
2. Caso apareça um aviso de segurança, permita a instalação de apps de fontes desconhecidas.  
3. Abra o arquivo APK baixado.  
4. Clique em instalar.  
5. Após a instalação, abra o aplicativo **ConselhoJá**.

---

## ⚠️ Observação importante

O aplicativo utiliza conexão com a internet para funcionar corretamente, pois depende de:

- API de conselhos;
- API de tradução;
- Firebase Firestore para salvar e carregar os conselhos.

---

## 📦 Principais dependências utilizadas

- `http: ^1.2.2`
- `firebase_core: ^3.6.0`
- `cloud_firestore: ^5.4.4`

---

## 🔗 Link do projeto

### Repositório GitHub

[GitHub do Projeto](https://github.com/lanacarol/conselhoja)

### APK para teste

[Baixar APK](https://na01.safelinks.protection.outlook.com/?url=https://api.flutlab.io/projects/3370183/download-app?key=zrgcsop4wksctkvybl2j&target=android-arm64&data=05|02||d63e58d3cd5340c69b9e08dea3cdd2b4|84df9e7fe9f640afb435aaaaaaaaaaaa|1|0|639128301551360139|Unknown|TWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ==|0|||&sdata=uR71m/jFGDpO4Jm+3pUIpF3TBB08yaFBZvG5bqM/aY0=&reserved=0)

---

## ✅ Requisitos atendidos

- [x] Aplicação desenvolvida em Flutter
- [x] Tema livre
- [x] Consumo de API externa
- [x] Exibição de dados de API
- [x] Integração com Firebase
- [x] Código-fonte Dart corretamente versionado
- [x] README documentado
- [x] Arquitetura da aplicação descrita
- [x] Aplicação pronta para prints
- [x] APK para testes

---

## 📚 Aprendizados

Durante o desenvolvimento deste projeto, foram praticados os seguintes conceitos:

- consumo de APIs REST em Flutter;
- manipulação de JSON;
- uso do pacote `http`;
- integração do Flutter com Firebase;
- persistência de dados em nuvem com Cloud Firestore;
- organização de arquivos em um projeto Flutter;
- construção de interface com widgets do Flutter;
- funcionamento do app em web e APK.

---

## 👩‍💻 Autora

Projeto desenvolvido por **Lana** como trabalho individual acadêmico utilizando **Flutter + Firebase**.
