![Build](https://img.shields.io/github/workflow/status/georgesmith46/bcbp/Release?style=for-the-badge)
![License](https://img.shields.io/github/license/georgesmith46/bcbp?style=for-the-badge)
![Bundlephobia](https://img.shields.io/bundlephobia/minzip/bcbp?style=for-the-badge)
![Version](https://img.shields.io/npm/v/bcbp?style=for-the-badge)

# BCBP

Encoding/decoding library for the IATA Bar Coded Boarding Pass

- Supports version 6 of the BCBP standard
- Supports any number of legs

## Getting started

### Installation

Installation is done using the
[`npm install` command](https://docs.npmjs.com/getting-started/installing-npm-packages-locally):

```bash
$ dart install bcbp
```

## Encode

```dart
String bcbpEncode(BarcodedBoardingPass bcbp)
```

### Example

```dart
import 'package:bcbp/bcbp.dart';

void main() {
  final output = bcbpEncode(
    BarcodedBoardingPass(
      data: BoardingPassData(
        legs: [
          Leg(
            operatingCarrierPNR: "LH8W9P",
            departureAirport: "HAN",
            arrivalAirport: "SGN",
            operatingCarrierDesignator: "VN",
            flightNumber: "1187",
            flightDate: DateTime.parse("2025-04-30T00:00:00.000Z"),
            compartmentCode: "Y",
            seatNumber: "001A",
            checkInSequenceNumber: "0025",
            passengerStatus: "1",
          )
        ],
        passengerName: "LE/PHUCANH",
      ),
    ),
  );
  print(output);
  // M1LE/PHUCANH           LH8W9P HANSGNVN 1187 120Y001A0025 106>10000
}
```

## Decode

```dart
BarcodedBoardingPass bcbpDecode(String barcodeString, {int? referenceYear})
```

### Example

```dart
import 'package:bcbp/bcbp.dart';

void main() {
  final output = bcbpDecode("M1LE/PHUCANH           LH8W9P HANSGNVN 1187 120Y001A0025 106>10000");
  print(output.data?.passengerName);
  // LE/PHUCANH
}
```

### Reference Year

Define the year which is used when parsing date fields. If this is undefined, the current year is used.

```dart
import 'package:bcbp/bcbp.dart';

void main() {
  final output = bcbpDecode(
      "M1LE/PHUCANH           LH8W9P HANSGNVN 1187 120Y001A0025 106>10000",
      referenceYear: 2024
  );
  print(output.data?.legs?[0].flightDate?.toIso8601String());
  // 2024-04-29T00:00:00.000Z
}
```

# BarcodedBoardingPass

See [types.ts](src/types.ts) for the definition.

## License

MIT