import 'dart:async';

class RegisterBloc {

  final StreamController<String> _errorController = StreamController<String>();

  Stream<String> get error => _errorController.stream;

  String _username = "";
  String _password = "";
  String _name = "";

  set setusername(String username) {
    _username = username.trim();
  }
  set setpassword(String pass) {
    _password = pass.trim();
  }
  set setname(String name) {
    _name = name.trim();
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
    if (_name.isEmpty) {
      _errorController.sink.add("Please enter your name");
      return false;
    }
    return true;
  }

  void dispose() {
    _errorController.close();
  }

}