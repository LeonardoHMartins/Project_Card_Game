// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:project_card_game/core/common/services/requests/request_result.dart';

abstract class RequestService {
  Future<RequestResult> get(
    String url, {
    Map<String, dynamic>? headers,
    bool? refreshToken = false,
  });
  Future<RequestResult> post(
    String url, {
    Map<String, dynamic> body,
    Map<String, dynamic>? headers,
    bool? refreshToken = false,
  });
  Future<RequestResult> put(
    String url, {
    Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  });
  Future<RequestResult> patch(
    String url, {
    Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  });
  Future<RequestResult> delete(
    String url, {
    Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  });
}
