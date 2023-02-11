import 'package:flutter/widgets.dart';
import 'package:my_first_app/model/user.dart';

class UserProvider with ChangeNotifier {
  late User user;
  void signin(User value) {
    user = value;
    notifyListeners();
  }
}