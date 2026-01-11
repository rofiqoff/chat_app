import 'package:chat_app/core/utils/date_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('formatTime returns formatted time string like 10.35 AM', () {
    final dateTime = DateTime(2023, 10, 27, 10, 35);
    final formatted = DateFormatter.formatTime(dateTime);
    expect(formatted, '10.35 AM');
  });

  test('formatTime handles PM correctly', () {
    final dateTime = DateTime(2023, 10, 27, 22, 35);
    final formatted = DateFormatter.formatTime(dateTime);
    expect(formatted, '10.35 PM');
  });
  
  test('formatTime handles single digit minutes correctly', () {
    final dateTime = DateTime(2023, 10, 27, 10, 5);
    final formatted = DateFormatter.formatTime(dateTime);
    expect(formatted, '10.05 AM');
  });
}
