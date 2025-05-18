/// Represents a single flight leg in a boarding pass.
///
/// Contains all the information related to one segment of a journey,
/// including flight details, seat assignment, and passenger-specific data.
class Leg {
  /// Passenger Name Record (PNR) or reservation number from the operating carrier
  String? operatingCarrierPNR;

  /// IATA code for the departure airport (3 characters)
  String? departureAirport;

  /// IATA code for the arrival airport (3 characters)
  String? arrivalAirport;

  /// IATA code for the operating carrier (2 characters)
  String? operatingCarrierDesignator;

  /// Flight number (up to 4 characters)
  String? flightNumber;

  /// Date of the flight
  DateTime? flightDate;

  /// Travel class/cabin code (1 character)
  String? compartmentCode;

  /// Assigned seat number
  String? seatNumber;

  /// Check-in sequence number
  String? checkInSequenceNumber;

  /// Passenger status (e.g., 1 for normal boarding)
  String? passengerStatus;

  /// Numeric code for the airline
  String? airlineNumericCode;

  /// Document serial number
  String? serialNumber;

  /// Indicates if passenger was selected for additional screening
  String? selecteeIndicator;

  /// International documentation verification status
  String? internationalDocumentationVerification;

  /// IATA code for the marketing carrier if different from operating carrier
  String? marketingCarrierDesignator;

  /// IATA code for frequent flyer program airline
  String? frequentFlyerAirlineDesignator;

  /// Frequent flyer number/account
  String? frequentFlyerNumber;

  /// ID indicator for identification documents
  String? idIndicator;

  /// Free baggage allowance information
  String? freeBaggageAllowance;

  /// Whether fast track service is provided
  bool? fastTrack;

  /// Additional airline-specific information
  String? airlineInfo;

  /// Creates a new flight leg with the specified parameters.
  Leg({
    this.operatingCarrierPNR,
    this.departureAirport,
    this.arrivalAirport,
    this.operatingCarrierDesignator,
    this.flightNumber,
    this.flightDate,
    this.compartmentCode,
    this.seatNumber,
    this.checkInSequenceNumber,
    this.passengerStatus,
    this.airlineNumericCode,
    this.serialNumber,
    this.selecteeIndicator,
    this.internationalDocumentationVerification,
    this.marketingCarrierDesignator,
    this.frequentFlyerAirlineDesignator,
    this.frequentFlyerNumber,
    this.idIndicator,
    this.freeBaggageAllowance,
    this.fastTrack,
    this.airlineInfo,
  });
}

/// Contains the main data elements of a boarding pass.
///
/// Holds passenger information and one or more flight legs.
class BoardingPassData {
  /// List of flight legs (segments) in the itinerary
  List<Leg>? legs;

  /// Passenger name in SURNAME/FIRSTNAME format
  String? passengerName;

  /// Additional passenger description or information
  String? passengerDescription;

  /// Source of check-in information
  String? checkInSource;

  /// Source of boarding pass issuance
  String? boardingPassIssuanceSource;

  /// Date when the boarding pass was issued
  DateTime? issuanceDate;

  /// Type of document (e.g., boarding pass, loyalty card)
  String? documentType;

  /// IATA code for the boarding pass issuer
  String? boardingPassIssuerDesignator;

  /// Baggage tag number
  String? baggageTagNumber;

  /// First baggage tag number
  String? firstBaggageTagNumber;

  /// Second baggage tag number
  String? secondBaggageTagNumber;

  /// Type of security data included
  String? securityDataType;

  /// Security-related data
  String? securityData;

  /// Creates a new boarding pass data object with the specified parameters.
  BoardingPassData({
    this.legs,
    this.passengerName,
    this.passengerDescription,
    this.checkInSource,
    this.boardingPassIssuanceSource,
    this.issuanceDate,
    this.documentType,
    this.boardingPassIssuerDesignator,
    this.baggageTagNumber,
    this.firstBaggageTagNumber,
    this.secondBaggageTagNumber,
    this.securityDataType,
    this.securityData,
  });
}

/// Metadata about the boarding pass barcode format.
///
/// Contains information about the barcode version and format.
class BoardingPassMetaData {
  /// Format code (typically 'M' for mandatory)
  String? formatCode;

  /// Number of flight legs included in the boarding pass
  int? numberOfLegs;

  /// Indicates if this is an electronic ticket ('E')
  String? electronicTicketIndicator;

  /// Version number indicator (typically '>')
  String? versionNumberIndicator;

  /// BCBP version number
  int? versionNumber;

  /// Indicator for presence of security data
  String? securityDataIndicator;

  /// Creates a new boarding pass metadata object with the specified parameters.
  BoardingPassMetaData({
    this.formatCode,
    this.numberOfLegs,
    this.electronicTicketIndicator,
    this.versionNumberIndicator,
    this.versionNumber,
    this.securityDataIndicator,
  });
}

/// The main container class for bar coded boarding pass data.
///
/// Combines both the actual boarding pass data and metadata about the barcode format.
class BarCodedBoardingPass {
  /// The boarding pass content data
  BoardingPassData? data;

  /// Metadata about the barcode format
  BoardingPassMetaData? meta;

  /// Creates a new bar coded boarding pass object with the specified data and metadata.
  BarCodedBoardingPass({
    this.data,
    this.meta,
  });
}
