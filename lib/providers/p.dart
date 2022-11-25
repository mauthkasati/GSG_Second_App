import 'package:flutter/cupertino.dart';

class P extends ChangeNotifier {
  String name = 'muath';
  sprovider() {
    name = 'الكهف';
    notifyListeners();
  }
}
