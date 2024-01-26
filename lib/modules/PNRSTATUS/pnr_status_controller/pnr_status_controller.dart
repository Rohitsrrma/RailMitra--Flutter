import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:railmitra/modules/HomePage/homepageController/homecontroller.dart';
import 'package:railmitra/modules/PNRSTATUS/repository/trainDetailsRepository.dart';
import 'package:railmitra/modules/webservice/webservice.dart';

import '../pnr_status_model/pnr_model.dart';

class PNRSTATUSCONTROLLER extends GetxController {
  TrainDetails? trainDetail = null;
  Webservice _webservice = Webservice();
  var isRunning = false.obs;

  Future<void> getPNStatus(String n) async {
    // _webservice.getPNRStatus("8605930659").then((value) {
    _webservice.getPNRStatus(n).then((value) {
      if (value != null) {
        isRunning.value = false;
        trainDetail = value;
      } else {}
    });
  }

  var isCircling = true.obs;
  void isCircling1() {
    Timer(
        Duration(
          seconds: 5,
        ), () {
      if (trainDetail == null) {
        isCircling.value = false;
      }
    });
  }

  @override
  void onInit() {
    isRunning.value = true;

    // getPNStatus();
    super.onInit();
  }
}
