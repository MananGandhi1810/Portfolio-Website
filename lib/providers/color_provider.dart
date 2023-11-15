import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color _color = Colors.blue;

  Color get color => _color;

  ColorProvider({Color color = Colors.blue}) {
    _color = color;
    notifyListeners();
  }

  void setColor(Color color) {
    _color = color;
    notifyListeners();
  }
}