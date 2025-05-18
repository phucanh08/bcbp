import 'package:bcbp/bcbp.dart';

void main() {
  // Example 1: Encoding a boarding pass
  final encodedBCBP = bcbpEncode(
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
  print('Encoded boarding pass:');
  print(encodedBCBP);
  // M1LE/PHUCANH           LH8W9P HANSGNVN 1187 120Y001A0025 106>10000

  // Example 2: Decoding a boarding pass
  final decodedBCBP = bcbpDecode(
      "M1LE/PHUCANH           LH8W9P HANSGNVN 1187 120Y001A0025 106>10000");
  print('\nDecoded boarding pass information:');
  print('Passenger name: ${decodedBCBP.data?.passengerName}');
  print('Flight number: ${decodedBCBP.data?.legs?[0].flightNumber}');
  print('Departure: ${decodedBCBP.data?.legs?[0].departureAirport}');
  print('Arrival: ${decodedBCBP.data?.legs?[0].arrivalAirport}');
  print('Seat: ${decodedBCBP.data?.legs?[0].seatNumber}');

  // Example 3: Decoding with reference year
  final decodedWithRefYear = bcbpDecode(
      "M1LE/PHUCANH           LH8W9P HANSGNVN 1187 120Y001A0025 106>10000",
      referenceYear: 2024);
  print('\nDecoding with reference year:');
  print(
      'Flight date: ${decodedWithRefYear.data?.legs?[0].flightDate?.toIso8601String()}');
  // 2024-04-29T00:00:00.000Z
}
