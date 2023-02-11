import 'dart:async';

import 'package:my_first_app/model/user.dart';

class LoginBloc {

  final StreamController<String> _errorController = StreamController<String>();

  Stream<String> get error => _errorController.stream;

  String _username = "";
  String _password = "";
  User _user = User();
  User get user => _user;
  set setusername(String username) {
    _username = username.trim();
  }
  set setpassword(String pass) {
    _password = pass.trim();
  }

  bool validateLogin() {
    if (_username.isEmpty) {
      _errorController.sink.add("Please enter username");
      return false;
    }
    if (_password.isEmpty) {
      _errorController.sink.add("Please enter password");
      return false;
    }
    if (_username == "ABC" && _password == "123") {
      _user = User(username: "ABC", pass: "123", avatar: "assets/icons/avatar.png", name: "K");
      return true;
    }
    _errorController.sink.add("Wrong password or username don't exist");
    return false;
  }

  void dispose() {
    _errorController.close();
  }
}
