import 'package:flutter/foundation.dart';

class CounterViewModel extends ChangeNotifier {
  int i = 0;

  void increment() {
    i++;
    print(i);
    notifyListeners();
  }

  void decrement() {
    i--;
    print(i);
    notifyListeners();
  }
}
