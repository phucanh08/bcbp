/// A library for encoding and decoding IATA Bar Coded Boarding Passes (BCBP).
///
/// This library supports version 6 of the BCBP standard and handles encoding and
/// decoding of boarding pass data according to IATA specifications.
///
/// Main functions:
/// - [bcbpEncode]: Converts a [BarCodedBoardingPass] object to BCBP string format
/// - [bcbpDecode]: Parses a BCBP string into a [BarCodedBoardingPass] object
library bcbp;

export 'src/decode.dart' show bcbpDecode;
export 'src/encode.dart' show bcbpEncode;
export 'src/types.dart';
export 'src/utils.dart';
