import 'package:flutter/material.dart';

class WidgetProvider extends ChangeNotifier {
  final List<String> _list = [];

  List<String> get list => _list;

  bool getIsTextField() {
    return _list.contains("Text Widget");
  }

  bool getImageClicked() {
    return _list.contains("Image Widget");
  }

  bool getButtonClicked() {
    return _list.contains("Button Widget");
  }

  void changeTextField() {
    if (_list.contains("Text Widget")) {
      _list.remove("Text Widget");
    } else {
      _list.add("Text Widget");
    }
    notifyListeners();
  }

  void changeImageClicked() {
    if (_list.contains("Image Widget")) {
      _list.remove("Image Widget");
    } else {
      _list.add("Image Widget");
    }
    notifyListeners();
  }

  void changeButtonClicked() {
    if (_list.contains("Button Widget")) {
      _list.remove("Button Widget");
    } else {
      _list.add("Button Widget");
    }
    notifyListeners();
  }

  void addWidgets(String widget) {
    _list.add(widget);
    notifyListeners();
  }
}