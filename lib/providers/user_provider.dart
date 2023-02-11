import 'package:flutter/widgets.dart';
import 'package:my_first_app/model/user.dart';

class UserProvider extends User with ChangeNotifier {
  void signin(User user) {
    setavatar = user.avatar;
    setname = user.name;
    setpass = user.pass;
    setusername = user.username;
    notifyListeners();
  }
}