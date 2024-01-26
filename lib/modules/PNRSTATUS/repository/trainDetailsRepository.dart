import 'package:hive/hive.dart';
import 'package:railmitra/modules/PNRSTATUS/pnr_status_model/pnr_model.dart';

class TrainDetailsHive {
  static const String TrainDetailBox = "TrainDetailBox";

  // TrainDetails? trainDetails;

  Future<bool> addTrainDetails(TrainDetails td) async {
    Box? box;
    try {
      box = await Hive.openBox<TrainDetails>(TrainDetailBox);
    } catch (e) {
      box = Hive.box(TrainDetailBox);
    }

    box.put(td.pnr, td);
    return true;
  }

  Future<TrainDetails> getTrainDetails(var pnr) async {
    var box;

    try {
      box = await Hive.openBox(TrainDetailBox);
    } catch (e) {
      box = await Hive.box(TrainDetailBox);
    }
    var td = box.get(pnr);
    return td;
  }
}
