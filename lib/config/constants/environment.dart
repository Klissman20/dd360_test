import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String publicKey = dotenv.env['PUBLIC_API_KEY'] ?? 'No key';
  static String privateKey = dotenv.env['PRIVATE_API_KEY'] ?? 'No key';
}
