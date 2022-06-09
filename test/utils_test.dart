import 'package:flutter_test/flutter_test.dart';
import 'package:sigarraio/UI/utils.dart';

void main() {
  test('Get hash code test', () {
    DateTime date = DateTime.now();
    int hash = getHashCode(date);
    expect(hash, date.day * 1000000 + date.month * 10000 + date.year);
  });

  test('Days in range test', () {
    DateTime date = DateTime(2020,01,01);
    DateTime dateEnd = DateTime(2020,02,01);
    List<DateTime> dates = daysInRange(date, dateEnd);
    expect(dates.length, 32);
  });
}