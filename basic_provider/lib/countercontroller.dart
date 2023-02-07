import 'package:basic_provider/counterModel.dart';
import 'package:flutter/material.dart';

class ControllerCounter extends ChangeNotifier {
  final Counter counter = Counter();
  increaseController() {
    counter.increase();
    notifyListeners();
  }
}
