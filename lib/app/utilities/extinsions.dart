import 'package:intl/intl.dart';

extension DateFormated on DateTime {
  String get format => DateFormat('yyyy-MM-dd').format(this);
}
