/// Converts a hexadecimal string to an integer.
///
/// Takes a [hex] string and parses it as a base-16 (hexadecimal) number.
///
/// Example:
///   hexToNumber('1A') => 26
int hexToNumber(String hex) {
  return int.parse(hex, radix: 16);
}

/// Converts an integer to a 2-character uppercase hexadecimal string.
///
/// Takes an integer [n] and returns it as a hexadecimal string,
/// padded with leading zeros if necessary to ensure it's at least 2 characters.
///
/// Example:
///   numberToHex(26) => '1A'
String numberToHex(int n) {
  return n.toRadixString(16).padLeft(2, '0').toUpperCase();
}

/// Converts a DateTime to a day-of-year string format.
///
/// Returns the day of the year (1-366) as a zero-padded 3-digit string.
/// If [addYearPrefix] is true, prepends the last digit of the year.
///
/// Example:
///   dateToDayOfYear(DateTime(2023, 2, 3)) => '034'
///   dateToDayOfYear(DateTime(2023, 2, 3), addYearPrefix: true) => '3034'
String dateToDayOfYear(DateTime date, {bool addYearPrefix = false}) {
  const oneDay = 1000 * 60 * 60 * 24;
  final dayOfYear = (DateTime.utc(date.year, date.month, date.day)
              .difference(DateTime.utc(date.year, 1, 0))
              .inMilliseconds /
          oneDay)
      .round();

  String yearPrefix = "";
  if (addYearPrefix) {
    yearPrefix =
        date.year.toString().substring(date.year.toString().length - 1);
  }

  return "$yearPrefix${dayOfYear.toString().padLeft(3, '0')}";
}

/// Converts a day-of-year string back to a DateTime.
///
/// Takes a [dayOfYear] string (3 digits if [hasYearPrefix] is false,
/// 4 digits if [hasYearPrefix] is true) and converts it to a DateTime.
///
/// If [hasYearPrefix] is true, the first digit is interpreted as the last digit of the year.
/// Uses [referenceYear] as the current year if provided, otherwise uses the current year.
///
/// Example:
///   dayOfYearToDate('034', false) => DateTime(currentYear, 2, 3)
///   dayOfYearToDate('3034', true) => DateTime(2023, 2, 3)
DateTime dayOfYearToDate(String dayOfYear, bool hasYearPrefix,
    {int? referenceYear}) {
  final currentYear = referenceYear ?? DateTime.now().toUtc().year;
  String year = currentYear.toString();
  String daysToAdd = dayOfYear;

  if (hasYearPrefix) {
    year = year.substring(0, year.length - 1) + daysToAdd[0];
    daysToAdd = daysToAdd.substring(1);

    if (int.parse(year) - currentYear > 2) {
      year = (int.parse(year) - 10).toString();
    }
  }

  final date = DateTime.utc(int.parse(year), 1, 0);
  try {
    return date.add(Duration(days: int.parse(daysToAdd)));
  } catch (e) {
    throw Exception('Invalid day of year: $dayOfYear');
  }
}
