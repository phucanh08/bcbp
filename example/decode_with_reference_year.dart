import 'package:bcbp/bcbp.dart';

void main() {
  final output = bcbpDecode(
    "M1LE/PHUCANH           LH8W9P HANSGNVN 1187 120Y001A0025 106>10000",
    referenceYear: 2024
  );
  print(output.data?.legs?[0].flightDate?.toIso8601String());
  // 2024-04-29T00:00:00.000Z
}
