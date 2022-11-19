import 'package:intl/intl.dart';

extension DateTimeParser on DateTime {
  String get toDateString => DateFormat('dd MMMM yyyy').format(this);
  String get toTimeString => DateFormat('HH:mm').format(this);
}
