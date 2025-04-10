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
