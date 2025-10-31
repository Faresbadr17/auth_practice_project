import 'package:flutter/material.dart';

class TextProvider extends ChangeNotifier {
  String _name = "";
  String get name => _name;
  String _mail = "";
  String get mail => _mail;

  void updateNameText(String name) {
    _name = name;
    notifyListeners();
  }

  void updateMailText(String mail) {
    _mail = mail;
    notifyListeners();
  }
}
