[![BCBP Version](https://img.shields.io/badge/bcbp-v0.0.1-green.svg?style=flat&logo=github)](https://github.com/phucanh08/bcbp/tree/0.0.1)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

# BCBP

Encoding/decoding library for the IATA Bar Coded Boarding Pass

- Supports version 6 of the BCBP standard
- Supports any number of legs

## Getting started

# Installing

Add Get to your pubspec.yaml file:

```yaml
dependencies:
  bcbp:
    git:
      url: https://github.com/phucanh08/bcbp.git
      ref: 0.0.1
```

Import get in files that it will be used:

```dart
import 'package:bcbp/bcbp.dart';
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

See [types.ts](lib/src/types.dart) for the definition.

## License

MIT