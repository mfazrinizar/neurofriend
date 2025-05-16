# Neurofriend
<div style="display:flex;">
    <img src="https://github.com/mfazrinizar/neurofriend/blob/main/assets/icons/logo.png?raw=true" alt="Icon" width="256"/>
    <img src="https://github.com/mfazrinizar/neurofriend/blob/main/assets/icons/logo_black.png?raw=true" alt="Icon" width="256"/>
</div>

---

## Overview

Neurofriend is a Flutter-based application designed to support neurodivergent individuals by providing accessible educational resources, daily challenges, and a supportive community. Our solution leverages Firebase for authentication, Firestore for data storage, and integrates Gemini fine-tuned model with various APIs to deliver a seamless and inclusive experience.

---

## Features

- **Personalized Learning Modules:** Interactive courses tailored for neurodivergent users.
- **Daily Challenges:** Gamified tasks to encourage engagement and personal growth.
- **Community Support:** Safe space for users to connect and share experiences.
- **Resource Library:** Curated articles, PDFs, and multimedia content.
- **Progress Tracking:** Visualize achievements and completed modules.
- **Accessibility:** Designed with inclusivity and usability in mind.

---

## Tech Stack

- **Frontend:** Flutter (Dart)
- **Backend:** Firebase (Authentication, Firestore, Storage, Cloud Functions)
- **ChatBot:** Fine-tuned Gemini Model for Neurodivergent
- **Other:** Google Cloud, SVG/Image assets, PDF integration

---

## How to Compile & Run
1. Install Java JDK (add to PATH), Android Studio, VS Code (or any preferred IDE), Flutter SDK, etc. to install all needed tools (SDK, NDK, extra tools) for Android development toolchain, please refer to this [link](https://docs.flutter.dev/get-started/install/windows/mobile).
2. Clone this repository.
3. Run `flutter pub get` to get rid of problems of missing dependencies.
4. Generate keystore to sign in release mode with command `keytool -genkey -alias server -validity 9999 -keyalg RSA -keystore keystore` using keytool from Java.
5. Rename the generated keystore with `<anyName>.keystore`.
6. Place the `<anyName>.keystore` to app-level Android folder (android/app/).
7. Create new file with name `key.properties` inside project-level Android folder (android/) with properties/contents as follow:
`storePassword=<yourKeyPassword>
keyPassword=<yourKeyPassword>
keyAlias=<yourKeyAlias>
storeFile=<anyName>.keystore`
8. Using your browser, navigate to [Firebase Console](https://console.firebase.google.com/) to setup the Firebase integration.
9. Click add project then proceed with the steps shown in Firebase Console web (setup Authentication, Firestore DB, Storage, FCM, and Functions).
10. Download `google-services.json` and place it to app-level Android folder (android/app/).
11. Edit `.env.example` name to `.env`, then edit value of each environment variables according to your API (check [Midtrans](https://midtrans.com) for Midtrans Payment Gateway, [Firebase Console](https://console.firebase.google.com/) for all Firebase-related API, [Gemini](https://aistudio.google.com/app/apikey) for Gemini API Key, deploy NeuroPay for Merchant Server URL (/neuropay/), and deploy NeuroFunctions (/neurofunctions/) for FCM push notification backend). `Remember to change your-production-key and your-sandbox-key in neuropay source code with your Midtrans API Key`.
12. If you don't want to generate your own AES 128/192/256 key, run `dart run build_runner build --define secure_dotenv_generator:secure_dotenv=OUTPUT_FILE=encryption_key.json`. If you decided to generate your own, run `dart run build_runner build --define secure_dotenv_generator:secure_dotenv=ENCRYPTION_KEY=yourEncryptionKey  --define secure_dotenv_generator:secure_dotenv=IV=yourIvKey --define secure_dotenv_generator:secure_dotenv=OUTPUT_FILE=encryption_key.json`.
13. Run `flutter build apk --release --split-per-abi --obfuscate --split-debug-info=/debug_info/` for splitted APK (each architecture) or `flutter build apk --release --obfuscate --split-debug-info=/debug_info/` for FAT APK (contains all ABIs)
14. Your build should be at `build/app/outputs/flutter-apk`
---