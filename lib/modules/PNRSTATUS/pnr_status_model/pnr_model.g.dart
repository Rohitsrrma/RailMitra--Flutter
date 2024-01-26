// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pnr_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainDetailsAdapter extends TypeAdapter<TrainDetails> {
  @override
  final int typeId = 1;

  @override
  TrainDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainDetails(
      trainNo: fields[0] as dynamic,
      name: fields[1] as dynamic,
      sourceStation: fields[12] as dynamic,
      destinationStation: fields[13] as dynamic,
      boarding: fields[2] as dynamic,
      destination: fields[3] as dynamic,
      dt: fields[4] as dynamic,
      sourceplatform: fields[11] as dynamic,
      destinationPlatform: fields[14] as dynamic,
      passengerInfo: (fields[5] as List).cast<PassengerInfo>(),
      trainRoutes: (fields[6] as List).cast<TrainRoute>(),
      destinationArrival: fields[9] as dynamic,
      destinationDeparture: fields[10] as dynamic,
      sourceArrival: fields[8] as dynamic,
      sourceDeparture: fields[7] as dynamic,
      pnr: fields[15] as dynamic,
      code: fields[16] as dynamic,
      error: fields[17] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, TrainDetails obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.trainNo)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.boarding)
      ..writeByte(3)
      ..write(obj.destination)
      ..writeByte(4)
      ..write(obj.dt)
      ..writeByte(5)
      ..write(obj.passengerInfo)
      ..writeByte(6)
      ..write(obj.trainRoutes)
      ..writeByte(7)
      ..write(obj.sourceDeparture)
      ..writeByte(8)
      ..write(obj.sourceArrival)
      ..writeByte(9)
      ..write(obj.destinationArrival)
      ..writeByte(10)
      ..write(obj.destinationDeparture)
      ..writeByte(11)
      ..write(obj.sourceplatform)
      ..writeByte(12)
      ..write(obj.sourceStation)
      ..writeByte(13)
      ..write(obj.destinationStation)
      ..writeByte(14)
      ..write(obj.destinationPlatform)
      ..writeByte(15)
      ..write(obj.pnr)
      ..writeByte(16)
      ..write(obj.code)
      ..writeByte(17)
      ..write(obj.error);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PassengerInfoAdapter extends TypeAdapter<PassengerInfo> {
  @override
  final int typeId = 2;

  @override
  PassengerInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PassengerInfo(
      currentCoach: fields[0] as dynamic,
      currentBerthNo: fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, PassengerInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.currentCoach)
      ..writeByte(1)
      ..write(obj.currentBerthNo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PassengerInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TrainRouteAdapter extends TypeAdapter<TrainRoute> {
  @override
  final int typeId = 3;

  @override
  TrainRoute read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainRoute(
      trainId: fields[0] as dynamic,
      stationId: fields[1] as int,
      arrivalTime: fields[2] as dynamic,
      departureTime: fields[3] as dynamic,
      haltTime: fields[4] as dynamic,
      stationCode: fields[5] as dynamic,
      stationName: fields[6] as dynamic,
      travellingDay: fields[7] as int,
      distance: fields[8] as dynamic,
      platform: fields[9] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, TrainRoute obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.trainId)
      ..writeByte(1)
      ..write(obj.stationId)
      ..writeByte(2)
      ..write(obj.arrivalTime)
      ..writeByte(3)
      ..write(obj.departureTime)
      ..writeByte(4)
      ..write(obj.haltTime)
      ..writeByte(5)
      ..write(obj.stationCode)
      ..writeByte(6)
      ..write(obj.stationName)
      ..writeByte(7)
      ..write(obj.travellingDay)
      ..writeByte(8)
      ..write(obj.distance)
      ..writeByte(9)
      ..write(obj.platform);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainRouteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
