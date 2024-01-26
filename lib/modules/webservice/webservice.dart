import 'dart:convert';
import 'package:requests/requests.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart';

import 'package:http/http.dart' as http;
import 'package:railmitra/modules/PNRSTATUS/pnr_status_model/pnr_model.dart';
import 'package:railmitra/modules/PNRSTATUS/repository/trainDetailsRepository.dart';

class Webservice {
  Future<TrainDetails?> getPNRStatus(String pnr) async {
    TrainDetails? trainDetail = null;
    String uri =
        "https://pnr-status-indian-railway.p.rapidapi.com/pnr-check/${pnr}";
    Map<String, String> headers = {
      "X-RapidAPI-Key": "22f38041b8msh005413c0aca5ab9p111c49jsn5fa0cbbc31b1",
      "X-RapidAPI-Host": "pnr-status-indian-railway.p.rapidapi.com"
    };
    var response = await http.get(Uri.parse(uri), headers: headers);
    if (response.statusCode == 200) {
      var jsonResponseCode = await json.decode(response.body)['code'];

      // var jsonResponse = await json.decode(response.body)['data'];
      // var jsonResponse = await json.decode(response.body);
      if (jsonResponseCode == 200) {
        var jsonResponse = await json.decode(response.body)['data'];
        if (jsonResponse != null) {
          trainDetail = TrainDetails?.fromJson(jsonResponse);
          trainDetail.pnr = pnr;
          var trainHiiveDb = TrainDetailsHive();
          await trainHiiveDb.addTrainDetails(trainDetail);
        } else {}
      } else {
        trainDetail == null;
      }
    } else {}

    return trainDetail;
  }

 
}

List<String> extractTextData(document) {
  List<String> textData = [];
  for (var element in document.querySelectorAll("*")) {
    if (element.localName != "script" && element.localName != "style") {
      var text = element.text.trim();
      if (text.isNotEmpty) {
        textData.add(text);
      }
    }
  }
  return textData;
}

List<String> extractBetweenStations(List<String> textData) {
  int startIndex = textData.indexOf("PF");
  int endIndex = textData.indexOf("Station", startIndex + 1);

  return textData.sublist(startIndex + 1, endIndex);
}

List<List<String>> createSublistsWithNineElements(List<String> inputList) {
  if (inputList.length < 6) {
    throw ArgumentError("The input list should have at least 6 elements.");
  }

  List<String> sourceStation = inputList.sublist(0, 6);
  List<String> destinationStation =
      inputList.sublist(inputList.length - 7, inputList.length - 1);

  List<String> betweenStations = inputList.sublist(6, inputList.length - 7);

  List<List<String>> sublists = [];

  for (int i = 0; i < betweenStations.length; i += 9) {
    int endIndex = i + 9;
    if (endIndex > betweenStations.length) {
      endIndex = betweenStations.length;
    }
    List<String> sublist = betweenStations.sublist(i, endIndex);
    sublists.add(sublist);
  }

  sublists.insert(0, sourceStation);
  sublists.add(destinationStation);

  return sublists;
}
