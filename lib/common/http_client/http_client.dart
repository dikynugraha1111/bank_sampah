import 'dart:io';
import 'package:http/http.dart' as http;

abstract class HttpClient<T> {
  Future<T> get(Uri url, Map<String, String>? headers);
  Future<T> post(Uri url, Map<String, String>? headers, Object? body);
  Future<T> put(Uri url, Map<String, String>? headers, Object? body);
  Future<T> patch(Uri url, Map<String, String>? headers, Object? body);
  Future<T> delete(Uri url, Map<String, String>? headers, Object? body);
  Future<T> multipartPost({
    required Uri url,
    required Map<String, String> headers,
    required Map<String, File> files,
    Map<String, String>? fields,
  });
  Future<T> multipartPut({
    required Uri url,
    required Map<String, String> headers,
    required Map<String, File> files,
    Map<String, String>? fields,
  });
}

class CoinsleekHttpClient implements HttpClient {
  final http.Client _client;

  CoinsleekHttpClient(this._client);

  @override
  Future<http.Response> delete(
    Uri url,
    Map<String, String>? headers,
    Object? body,
  ) async {
    try {
      final response = await _client.delete(
        url,
        headers: headers,
        body: body,
      );
      return response;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<http.Response> get(
    Uri url,
    Map<String, String>? headers,
  ) async {
    try {
      final response = await _client.get(
        url,
        headers: headers,
      );
      return response;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<http.Response> post(
    Uri url,
    Map<String, String>? headers,
    Object? body,
  ) async {
    try {
      final response = await _client.post(
        url,
        headers: headers,
        body: body,
      );
      return response;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<http.Response> put(
    Uri url,
    Map<String, String>? headers,
    Object? body,
  ) async {
    try {
      final response = await _client.put(url, headers: headers, body: body);
      return response;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<http.Response> patch(
    Uri url,
    Map<String, String>? headers,
    Object? body,
  ) async {
    try {
      final response = await _client.patch(url, headers: headers, body: body);
      return response;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<http.StreamedResponse> multipartPost({
    required Uri url,
    required Map<String, String> headers,
    required Map<String, File> files,
    Map<String, String>? fields,
  }) async {
    http.MultipartRequest request = http.MultipartRequest('POST', url);
    request.headers.addAll(headers);
    if (fields != null) request.fields.addAll(fields);
    files.forEach((key, value) {
      request.files.add(http.MultipartFile.fromBytes(
        key,
        value.readAsBytesSync(),
        filename: value.path.split('/').last,
      ));
    });
    return request.send();
  }

  @override
  Future<http.StreamedResponse> multipartPut({
    required Uri url,
    required Map<String, String> headers,
    required Map<String, File> files,
    Map<String, String>? fields,
  }) async {
    http.MultipartRequest request = http.MultipartRequest('PUT', url);
    request.headers.addAll(headers);
    if (fields != null) request.fields.addAll(fields);
    files.forEach((key, value) {
      request.files.add(http.MultipartFile.fromBytes(
        key,
        value.readAsBytesSync(),
        filename: value.path.split('/').last,
      ));
    });
    return request.send();
  }

  factory CoinsleekHttpClient.create() {
    final client = http.Client();
    return CoinsleekHttpClient(client);
  }
}
