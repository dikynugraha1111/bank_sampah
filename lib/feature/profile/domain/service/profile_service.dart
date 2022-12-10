import 'dart:convert';

import 'package:api_exception/api_exception.dart';
import 'package:bank_sampah/common/endpoint/endpoint.dart';
import 'package:bank_sampah/common/http_client/http_client.dart';
import 'package:bank_sampah/common/injection/injection.dart';

abstract class ProfileServiceAbstract {
  Future<String> onGetBalance(String userID);
}

class ProfileService implements ProfileServiceAbstract {
  final HttpClient client;
  final Endpoint endpoint;

  ProfileService({
    required this.client,
    required this.endpoint,
  });

  @override
  Future<String> onGetBalance(String userID) async {
    try {
      final url = endpoint.getUserBalance(userID);
      final response = await client.get(
        url,
        null,
      );
      final balance = json.decode(response.body);
      return balance["bankIncome"] ?? "0";
    } on AppException {
      rethrow;
    }
  }

  factory ProfileService.create() {
    return ProfileService(
      client: Injection.httpClient,
      endpoint: Injection.endpoint,
    );
  }
}
