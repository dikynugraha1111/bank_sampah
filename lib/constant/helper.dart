import 'package:bank_sampah/constant/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeParser on DateTime {
  String get toDateString => DateFormat('dd MMMM yyyy').format(this);
  String get toTimeString => DateFormat('HH:mm').format(this);
}

class UriHelper {
  static Uri createUrl({
    required String host,
    String? path,
    Map<String, dynamic>? queryParameters,
  }) =>
      Uri(
        scheme: "https",
        host: host,
        path: path,
        queryParameters: queryParameters,
      );
}

showDefaultSnackbar(
  BuildContext context,
  String message,
) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar
    ..showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          message,
          style: AppText.text12.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
}
