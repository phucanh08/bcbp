import 'package:bcbp/bcbp.dart';

void main() {
  final output = bcbpDecode("M1LE/PHUCANH           LH8W9P HANSGNVN 1187 120Y001A0025 106>10000");
  print(output.data?.passengerName);
  // LE/PHUCANH
}