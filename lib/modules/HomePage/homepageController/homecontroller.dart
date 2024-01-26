import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railmitra/modules/HomePage/RecentModel/RecentModel.dart';

class HomeController extends GetxController {
  final TextEditingController trainNameNumberController =
      TextEditingController();

  FocusNode focusNode = FocusNode();

  List trainList = [
    'Vande Bharat',
    'Janta Express',
    'Bathinda SF',
    'Inter City Express',
    'Kalka Shatabaddi',
    'Vande Bharat'
        'Janta Express',
    'Bathinda SF',
    'Inter City Express',
    'Kalka Shatabaddi'
  ];
}
