import 'package:flutter/cupertino.dart';

class stateSettingProvider with ChangeNotifier {
  bool isSellerMode = false;
  sellerModeOn() {
    isSellerMode = true;
    notifyListeners();
  }

  buyerModeOn() {
    isSellerMode = false;
    notifyListeners();
  }
}
