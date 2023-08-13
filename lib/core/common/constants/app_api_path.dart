import 'package:project_card_game/core/common/constants/app_constants.dart';

class ApiPath {
  static String get baseUrl => AppConstants.baseUrl;

  static String get login => '$baseUrl/usuario/login';
  static String get qrCode => '$baseUrl/usuario/login-qrcode';
  static String get config => '$baseUrl/configuracao/geral';
  static String get refreshToken => '$baseUrl/auth/token';
  static String get createObs => '$baseUrl/observacao/cadastra';
  static String observarList(int userId) => '$baseUrl/observacao/lista/$userId';
}
