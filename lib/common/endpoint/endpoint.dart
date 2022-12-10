import 'package:bank_sampah/constant/helper.dart';

class Endpoint {
  final String baseURL;

  Endpoint({
    required this.baseURL,
  });

  // Note for example endpoint
  //  Uri getPaperTradeAccountWallet(String accountID) {
  //   return UriHelper.createUrl(
  //     host: _baseURL,
  //     path: "/api/v2/papertrade/account/account",
  //     queryParameters: {
  //       'account_id': accountID,
  //     },
  //   );
  // }

  Uri login() {
    return UriHelper.createUrl(
      host: baseURL,
      path: "/api/login-user",
    );
  }

  Uri getUserBalance(String userID) {
    return UriHelper.createUrl(
      host: baseURL,
      path: "/api/bank-income-all/$userID",
    );
  }

  Uri getTransactionHistory(String userID) {
    return UriHelper.createUrl(
      host: baseURL,
      path: "/api/bank-income/$userID",
    );
  }

  Uri getSampahItem() {
    return UriHelper.createUrl(
      host: baseURL,
      path: "/api/get-bank-item",
    );
  }

  Uri callAdmin() {
    return UriHelper.createUrl(
      host: baseURL,
      path:
          "/+628977910651?text=Hallo%0ASaya%20memiliki%20masalah%20dengan%20aplikasi%20bank%20sampah.%20Bisakah%20anda%20membantu%20saya%3F",
    );
  }

  factory Endpoint.baseURLAdmin() {
    return Endpoint(
      baseURL: "wa.me",
    );
  }

  factory Endpoint.staging() {
    return Endpoint(
      baseURL: "tes.futake.co.id",
    );
  }
}
