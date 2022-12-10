import 'package:api_exception/api_exception.dart';
import 'package:bank_sampah/common/endpoint/endpoint.dart';
import 'package:bank_sampah/common/http_client/http_client.dart';
import 'package:bank_sampah/common/injection/injection.dart';
import 'package:bank_sampah/feature/penjualan/domain/model/penjualan_sampah_response.dart';

abstract class PenjualanServiceAbstract {
  Future<BankSampahResponse> onGetAllPenjualanData(String userID);
}

class PenjualanService implements PenjualanServiceAbstract {
  final HttpClient client;
  final Endpoint endpoint;

  PenjualanService({
    required this.client,
    required this.endpoint,
  });

  @override
  Future<BankSampahResponse> onGetAllPenjualanData(String userID) async {
    try {
      final url = endpoint.getTransactionHistory(userID);
      final response = await client.get(
        url,
        null,
      );
      ExceptionHandling.handelAPIError(
        desireStatusCode: 201,
        response: response,
      );
      return BankSampahResponse.fromJson(response.body);
    } on AppException {
      rethrow;
    }
  }

  factory PenjualanService.create() {
    return PenjualanService(
      client: Injection.httpClient,
      endpoint: Injection.endpoint,
    );
  }
}
