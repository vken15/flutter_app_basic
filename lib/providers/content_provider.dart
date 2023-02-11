import 'package:flutter/widgets.dart';
import 'package:my_first_app/model/content.dart';

class ContentProvider with ChangeNotifier {
  late Content ct;
  void loadingcontent(Content content) {
    ct = content;
    notifyListeners();
  }
}