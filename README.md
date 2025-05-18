# BCBP

[![BCBP Version](https://img.shields.io/badge/bcbp-v0.0.2-green.svg?style=flat&logo=github)](https://github.com/phucanh08/bcbp/tree/0.0.2)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

Encoding/decoding library for the IATA Bar Coded Boarding Pass

- Supports version 6 of the BCBP standard
- Supports any number of legs

## Requirements
- Dart 2.16.0 or newer

## Usage

### Encode

```dart
String bcbpEncode(BarCodedBoardingPass bcbp)
```

#### Example

```dart
import 'package:bcbp/bcbp.dart';

void main() {
  final output = bcbpEncode(
    BarCodedBoardingPass(
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

### Decode

```dart
BarCodedBoardingPass bcbpDecode(String barcodeString, {int? referenceYear})
```

#### Example

```dart
import 'package:bcbp/bcbp.dart';

void main() {
  final output = bcbpDecode("M1LE/PHUCANH           LH8W9P HANSGNVN 1187 120Y001A0025 106>10000");
  print(output.data?.passengerName);
  // LE/PHUCANH
}
```

### Decode with Reference Year

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

## BarCodedBoardingPass

See [types.dart](lib/src/types.dart) for the definition.

## Example app

Find the example app [here](./example).

## Contributing

Contributions are welcome.
In case of any problems look at [existing issues](https://github.com/phucanh08/bcbp/issues), if you cannot find anything related to your problem then open an issue.
Create an issue before opening a [pull request](https://github.com/phucanh08/bcbp/pulls) for non trivial fixes.
In case of trivial fixes open a [pull request](https://github.com/phucanh08/bcbp/pulls) directly.