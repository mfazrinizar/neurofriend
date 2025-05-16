import 'package:flutter_secure_dotenv/flutter_secure_dotenv.dart';

part 'env.g.dart';

@DotEnvGen(
  filename: '.env',
  fieldRename: FieldRename.screamingSnake,
)
abstract class Env {
  static Env create() {
    String encryptionKey = const String.fromEnvironment(
        "ENV_ENCRYPTION_KEY"); // On build, change with your generated encryption key in launch.json.example into launch.json (VS Code)
    String iv = const String.fromEnvironment(
        "ENV_IV_KEY"); // On build, change with your generated iv in launch.json.example into launch.json (VS Code)
    return Env(encryptionKey, iv);
  }

  const factory Env(String encryptionKey, String iv) =
      _$Env; // You can call const env = Env('encryption-key', 'iv') from another Dart file using this

  const Env._();

  // Declare your environment variables as abstract getters
  @FieldKey(defaultValue: "")
  String get midtransClientKeyProduction;

  @FieldKey(defaultValue: "")
  String get midtransClientKeySandbox;

  @FieldKey(defaultValue: "")
  String get midtransMerchantBaseUrl;

  @FieldKey(defaultValue: "")
  String get midtransCancelBaseUrl;

  @FieldKey(defaultValue: "")
  String get geminiApiKey;

  // Firebase Android
  @FieldKey(defaultValue: "")
  String get firebaseAndroidApiKey;

  @FieldKey(defaultValue: "")
  String get firebaseAndroidAppId;

  @FieldKey(defaultValue: "")
  String get firebaseAndroidMessagingSenderId;

  @FieldKey(defaultValue: "")
  String get firebaseAndroidProjectId;

  @FieldKey(defaultValue: "")
  String get firebaseAndroidDatabaseUrl;

  @FieldKey(defaultValue: "")
  String get firebaseAndroidStorageBucket;

  // Firebase iOS
  @FieldKey(defaultValue: "")
  String get firebaseIosApiKey;

  @FieldKey(defaultValue: "")
  String get firebaseIosAppId;

  @FieldKey(defaultValue: "")
  String get firebaseIosMessagingSenderId;

  @FieldKey(defaultValue: "")
  String get firebaseIosProjectId;

  @FieldKey(defaultValue: "")
  String get firebaseIosDatabaseUrl;

  @FieldKey(defaultValue: "")
  String get firebaseIosStorageBucket;

  @FieldKey(defaultValue: "")
  String get firebaseIosBundleId;
}
