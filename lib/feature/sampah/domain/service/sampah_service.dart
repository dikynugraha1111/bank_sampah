import 'package:api_exception/api_exception.dart';
import 'package:bank_sampah/common/endpoint/endpoint.dart';
import 'package:bank_sampah/common/http_client/http_client.dart';
import 'package:bank_sampah/common/injection/injection.dart';
import 'package:bank_sampah/feature/sampah/domain/model/sampah_response.dart';

abstract class SampahService {
  Future<SampahItemResponse> onInitSampahItem();
}

class SampahServiceImpl implements SampahService {
  final HttpClient client;
  final Endpoint endpoint;

  SampahServiceImpl(this.client, this.endpoint);

  @override
  Future<SampahItemResponse> onInitSampahItem() async {
    try {
      final url = endpoint.getSampahItem();
      final response = await client.get(
        url,
        null,
      );
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return SampahItemResponse.fromJson(response.body);
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  factory SampahServiceImpl.create() {
    return SampahServiceImpl(
      Injection.httpClient,
      Injection.endpoint,
    );
  }
}
