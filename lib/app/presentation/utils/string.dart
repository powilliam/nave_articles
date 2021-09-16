import 'package:dart_date/dart_date.dart';

extension StringExtension on String {
  String capitalize() =>
      "${substring(0, 1).toUpperCase()}${substring(1).toLowerCase()}";

  String date() => Date.parse(this).format('d MMM y');
}
