class Content {
  String _username;
  String _name;
  String _avatar;
  String _image;
  String get username => _username;
  String get name => _name;
  String get avatar => _avatar;
  String get image => _image;
  set setusername(String username) {
    _username = username.trim();
  }
  set setavatar(String avatar) {
    _avatar = avatar.trim();
  }
  set setname(String name) {
    _name = name.trim();
  }
  set setimage(String image) {
    _image = image.trim();
  }

  Content({
    String username = "",
    String name = "",
    String avatar = "",
    String image = "",
  })  : _username = username,
        _name = name,
        _avatar = avatar,
        _image = image;
}