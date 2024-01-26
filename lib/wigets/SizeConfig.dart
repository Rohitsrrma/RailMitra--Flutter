import 'package:flutter/material.dart';

class SizeConfig {
  
  static Size sizeConfig(BuildContext ctx) {
    var size = MediaQuery.of(ctx).size;
    return size;
  }
}
