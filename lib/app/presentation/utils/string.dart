extension StringExtension on String {
  String capitalize() =>
      "${substring(0, 1).toUpperCase()}${substring(1).toLowerCase()}";
}
