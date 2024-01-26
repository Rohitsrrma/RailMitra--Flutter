import 'package:hive/hive.dart';

part 'pnr_model.g.dart';

@HiveType(typeId: 1)
class TrainDetails {
  @HiveField(0)
  var trainNo;
  @HiveField(1)
  var name;
  @HiveField(2)
  var boarding;
  @HiveField(3)
  var destination;
  @HiveField(4)
  var dt;
  @HiveField(5)
  final List<PassengerInfo> passengerInfo;
  @HiveField(6)
  final List<TrainRoute> trainRoutes;
  @HiveField(7)
  var sourceDeparture;
  @HiveField(8)
  var sourceArrival;

  @HiveField(9)
  var destinationArrival;
  @HiveField(10)
  var destinationDeparture;
  @HiveField(11)
  var sourceplatform;
  @HiveField(12)
  var sourceStation;
  @HiveField(13)
  var destinationStation;
  @HiveField(14)
  var destinationPlatform;
  @HiveField(15)
  var pnr;
  @HiveField(16)
  var code;
  @HiveField(17)
  var error;

  TrainDetails(
      {required this.trainNo,
      required this.name,
      required this.sourceStation,
      required this.destinationStation,
      required this.boarding,
      required this.destination,
      required this.dt,
      required this.sourceplatform,
      required this.destinationPlatform,
      required this.passengerInfo,
      required this.trainRoutes,
      required this.destinationArrival,
      required this.destinationDeparture,
      required this.sourceArrival,
      required this.sourceDeparture,
      this.pnr,
      required this.code,
      required this.error});

  factory TrainDetails.fromJson(Map<String, dynamic> json) {
    return TrainDetails(
      error: json['error'],
      code: json['code'],
      trainNo: json['trainInfo']['trainNo'],
      name: json['trainInfo']['name'],
      destinationPlatform: json["destinationInfo"]["platform"],
      sourceStation: json["boardingInfo"]["stationName"],
      destinationStation: json["destinationInfo"]["stationName"],
      boarding: json['boardingInfo']['stationCode'],
      sourceplatform: json['boardingInfo']['platform'],
      destination: json['destinationInfo']['stationCode'],
      dt: json['trainInfo']['dt'],
      destinationArrival: json["destinationInfo"]["arrivalTime"],
      destinationDeparture: json["destinationInfo"]["departureTime"],
      sourceArrival: json["boardingInfo"]["arrivalTime"],
      sourceDeparture: json["boardingInfo"]["departureTime"],
      passengerInfo: List<PassengerInfo>.from(
          json['passengerInfo'].map((e) => PassengerInfo.fromJson(e))),
      trainRoutes: List<TrainRoute>.from(
          json['trainRoutes'].map((e) => TrainRoute.fromJson(e))),
    );
  }
}

@HiveType(typeId: 2)
class PassengerInfo {
  @HiveField(0)
  var currentCoach;
  @HiveField(1)
  var currentBerthNo;

  PassengerInfo({
    required this.currentCoach,
    required this.currentBerthNo,
  });

  factory PassengerInfo.fromJson(Map<String, dynamic> json) {
    return PassengerInfo(
      currentCoach: json['currentCoach'],
      currentBerthNo: json['currentBerthNo'],
    );
  }
}

@HiveType(typeId: 3)
class TrainRoute {
  @HiveField(0)
  var trainId;
  @HiveField(1)
  final int stationId;
  @HiveField(2)
  var arrivalTime;
  @HiveField(3)
  var departureTime;
  @HiveField(4)
  var haltTime;
  @HiveField(5)
  var stationCode;
  @HiveField(6)
  var stationName;
  @HiveField(7)
  final int travellingDay;
  @HiveField(8)
  var distance;
  @HiveField(9)
  var platform;

  TrainRoute({
    required this.trainId,
    required this.stationId,
    required this.arrivalTime,
    required this.departureTime,
    required this.haltTime,
    required this.stationCode,
    required this.stationName,
    required this.travellingDay,
    required this.distance,
    required this.platform,
  });

  factory TrainRoute.fromJson(Map<String, dynamic> json) {
    return TrainRoute(
      trainId: json['trainId'],
      stationId: json['stationId'],
      arrivalTime: json['arrivalTime'],
      departureTime: json['departureTime'],
      haltTime: json['haltTime'],
      stationCode: json['stationCode'],
      stationName: json['stationName'],
      travellingDay: json['travellingDay'],
      distance: json['distance'],
      platform: json['platform'],
    );
  }
}
