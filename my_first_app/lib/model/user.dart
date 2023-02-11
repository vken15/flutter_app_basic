class User {
  String _username;
  String _pass;
  String _name;
  String _avatar;
  String get username => _username;
  String get pass => _pass;
  String get name => _name;
  String get avatar => _avatar;
  set setusername(String username) {
    _username = username.trim();
  }

  set setavatar(String avatar) {
    _avatar = avatar.trim();
  }

  set setname(String name) {
    _name = name.trim();
  }

  set setpass(String pass) {
    _pass = pass.trim();
  }

  User({
    String username = "",
    String pass = "",
    String name = "",
    String avatar = "",
  })  : _username = username,
        _pass = pass,
        _name = name,
        _avatar = avatar;
}