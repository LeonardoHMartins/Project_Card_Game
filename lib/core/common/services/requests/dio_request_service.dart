// import 'package:dio/dio.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:project_card_game/core/common/services/requests/errors/not_internet_connection_exception.dart';
// import 'package:project_card_game/core/common/services/requests/request_result.dart';
// import 'package:project_card_game/core/common/services/requests/request_service.dart';

// class DioRequestService extends RequestService {
//   final Dio _dio;
//   DioRequestService({Dio? dio}) : _dio = dio ?? Dio();

//   @override
//   Future<RequestResult> get(String url, {Map<String, dynamic>? headers, bool? refreshToken = false}) async {
//     try {
//       if (!(await _isConnected)) {
//         throw NotInternetConnectionException();
//       }

//       if (refreshToken ?? false) {
//         _dio.interceptors.add(
//           InterceptorsWrapper(
//             onRequest: (options, handler) async {
//               var grantTypes = await UserLogic.getLoggedUserGrantTypes();
//               var uuidUser = await UserLogic.getLoggedUserUuid();
//               var clientId = await UserLogic.getLoggedUserClientId();
//               var clientSecret = await UserLogic.getLoggedUserClientSecret();
//               var base = await UserLogic.getLoggedUserBase();

//               var hasConnection = await _isConnected;

//               if (hasConnection && uuidUser != null && grantTypes != null && clientId != null && clientSecret != null && base != null) {
//                 await Modular.get<RefreshAccessToken>()(
//                   RefreshAccessTokenParams(
//                     grantTypes: grantTypes,
//                     clientId: clientId,
//                     clientSecret: clientSecret,
//                     base: base,
//                     uuidUser: uuidUser,
//                   ),
//                 );
//               }
//             },
//           ),
//         );
//       }

//       var response = await _dio.get(url, options: Options(headers: headers));
//       if ((response.statusCode ?? 404) >= 200 && (response.statusCode ?? 404) < 300) {
//         return RequestResult(
//           statusCode: response.statusCode ?? 0,
//           data: response.data,
//           headers: response.headers.map,
//           success: true,
//           message: response.statusMessage ?? '',
//         );
//       }
//       throw Exception('GET Request Error, no success status code returned');
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<RequestResult> post(
//     String url, {
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? headers,
//     bool? refreshToken = false,
//   }) async {
//     try {
//       if (!(await _isConnected)) {
//         throw NotInternetConnectionException();
//       }

//       if (refreshToken ?? false) {
//         _dio.interceptors.add(
//           InterceptorsWrapper(
//             onRequest: (options, handler) async {
//               var grantTypes = await UserLogic.getLoggedUserGrantTypes();
//               var uuidUser = await UserLogic.getLoggedUserUuid();
//               var clientId = await UserLogic.getLoggedUserClientId();
//               var clientSecret = await UserLogic.getLoggedUserClientSecret();
//               var base = await UserLogic.getLoggedUserBase();

//               var hasConnection = await _isConnected;

//               if (hasConnection && uuidUser != null && grantTypes != null && clientId != null && clientSecret != null && base != null) {
//                 await Modular.get<RefreshAccessToken>()(
//                   RefreshAccessTokenParams(
//                     grantTypes: grantTypes,
//                     clientId: clientId,
//                     clientSecret: clientSecret,
//                     base: base,
//                     uuidUser: uuidUser,
//                   ),
//                 );
//               }
//             },
//           ),
//         );
//       }

//       var response = await _dio.post(url, data: body, options: Options(headers: headers));
//       if ((response.statusCode ?? 404) >= 200 && (response.statusCode ?? 404) < 300) {
//         return RequestResult(
//           statusCode: response.statusCode ?? 0,
//           data: response.data,
//           headers: response.headers.map,
//           success: true,
//           message: response.statusMessage ?? '',
//         );
//       }
//       throw Exception('POST Request Error, no success status code returned');
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<RequestResult> put(
//     String url, {
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? headers,
//   }) async {
//     try {
//       if (!(await _isConnected)) {
//         throw NotInternetConnectionException();
//       }
//       var response = await _dio.put(url, data: body, options: Options(headers: headers));
//       if ((response.statusCode ?? 404) >= 200 && (response.statusCode ?? 404) < 300) {
//         return RequestResult(
//           statusCode: response.statusCode ?? 0,
//           data: response.data,
//           headers: response.headers.map,
//           success: true,
//           message: response.statusMessage ?? '',
//         );
//       }
//       throw Exception('PUT Request Error, no success status code returned');
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<RequestResult> patch(
//     String url, {
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? headers,
//   }) async {
//     try {
//       if (!(await _isConnected)) {
//         throw NotInternetConnectionException();
//       }
//       var response = await _dio.patch(url, data: body, options: Options(headers: headers));
//       if ((response.statusCode ?? 404) >= 200 && (response.statusCode ?? 404) < 300) {
//         return RequestResult(
//           statusCode: response.statusCode ?? 0,
//           data: response.data,
//           headers: response.headers.map,
//           success: true,
//           message: response.statusMessage ?? '',
//         );
//       }
//       throw Exception('PATCH Request Error, no success status code returned');
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<RequestResult> delete(
//     String url, {
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? headers,
//   }) async {
//     try {
//       if (!(await _isConnected)) {
//         throw NotInternetConnectionException();
//       }
//       var response = await _dio.delete(
//         url,
//         data: body,
//         options: Options(headers: headers),
//       );
//       if ((response.statusCode ?? 404) >= 200 && (response.statusCode ?? 404) < 300) {
//         return RequestResult(
//           statusCode: response.statusCode ?? 0,
//           data: response.data,
//           headers: response.headers.map,
//           success: true,
//           message: response.statusMessage ?? '',
//         );
//       }
//       throw Exception('DELETE Request Error, no success status code returned');
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<bool> get _isConnected async => await Modular.get<ConnectionService>().isConnected;
// }
