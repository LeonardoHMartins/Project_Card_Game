import 'package:dart_ping/dart_ping.dart';
import 'package:project_card_game/core/common/services/connection/connection_service.dart';

class ConnectionServiceImpl extends ConnectionService {
  ConnectionServiceImpl();

  @override
  Future<bool> get isConnected async {
    try {
      Ping ping = Ping('8.8.8.8', count: 1);
      var response = await ping.stream.first;
      return response.error == null;
    } catch (e) {
      return false;
    }
  }
}
