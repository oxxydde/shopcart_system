import 'package:flutter/foundation.dart';

class CartSystem with ChangeNotifier {
  List<List<String>> cartList = [];

  void addItem(String name, String img) {
    cartList.add([name, img]);
    notifyListeners();
  }

  void removeItem(String name, String img) {
    cartList.removeWhere((element) => listEquals(element, [name, img]));
    notifyListeners();
  }
}