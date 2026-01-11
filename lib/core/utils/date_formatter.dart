import 'package:intl/intl.dart';

class DateFormatter {
  /// Formats a [DateTime] into a string like "10.35 AM".
  static String formatTime(DateTime dateTime) {
    // 'h' for 12-hour clock (1-12), 'mm' for minutes, 'a' for AM/PM marker.
    // We use a dot '.' as separator as requested.
    return DateFormat('h.mm a').format(dateTime);
  }

  /// Formats a [DateTime] into a standard string like "10:35 AM".
  static String formatTimeStandard(DateTime dateTime) {
    return DateFormat.jm().format(dateTime);
  }
}
