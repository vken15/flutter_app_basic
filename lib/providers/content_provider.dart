import 'package:flutter/widgets.dart';
import 'package:my_first_app/model/content.dart';

class ContentProvider extends Content with ChangeNotifier {
  void loadingcontent(Content content) {
    setavatar = content.avatar;
    setname = content.name;
    setimage = content.image;
    setusername = content.username;
    notifyListeners();
  }
}