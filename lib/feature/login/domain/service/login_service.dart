import 'package:api_exception/api_exception.dart';
import 'package:bank_sampah/common/endpoint/endpoint.dart';
import 'package:bank_sampah/common/http_client/http_client.dart';
import 'package:bank_sampah/common/injection/injection.dart';
import 'package:bank_sampah/feature/login/domain/model/user_profile.dart';

abstract class LoginServiceAbstract {
  Future<UserProfile> login(
    String username,
    String password,
  );
}

class LoginService implements LoginServiceAbstract {
  final HttpClient httpClient;
  final Endpoint endpoint;

  LoginService({
    required this.httpClient,
    required this.endpoint,
  });

  @override
  Future<UserProfile> login(
    String username,
    String password,
  ) async {
    try {
      final url = endpoint.login();
      final response = await httpClient.post(
        url,
        null,
        {
          "username": username,
          "password": password,
        },
      );
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return UserProfile.fromJson(response.body);
    } on AppException {
      rethrow;
    } catch (exception) {
      throw UnknownException(message: exception.toString());
    }
  }

  factory LoginService.create() {
    return LoginService(
      httpClient: Injection.httpClient,
      endpoint: Injection.endpoint,
    );
  }
}
