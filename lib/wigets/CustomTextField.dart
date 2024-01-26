import 'package:flutter/material.dart';

class CustomTextField extends TextField {
  final TextEditingController controller;
  final InputDecoration decoration;
  final TextStyle style;
  
  final ValueChanged<String> onSubmitted;

  CustomTextField(
    this.onSubmitted,
     {
    required this.controller,
    required this.style,
    this.decoration = const InputDecoration(),
  }) : super(
          cursorHeight: 15,
          controller: controller,
          decoration: decoration,
          style: style,
          onSubmitted: onSubmitted,
        );

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller: controller,
      decoration: decoration,
      style: style,
      onSubmitted: onSubmitted,
    );
  }
}
