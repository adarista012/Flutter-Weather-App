import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  Color _seedColor = Colors.white;
  Color get seedColor => _seedColor;

  void setSeedColor(Color newSeedColor) {
    _seedColor = newSeedColor;

    update();
  }
}
