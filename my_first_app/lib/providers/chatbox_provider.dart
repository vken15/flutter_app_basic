import 'package:flutter/cupertino.dart';
import 'package:my_first_app/model/chat_log.dart';
import 'package:my_first_app/model/user.dart';

class ChatBoxProvider with ChangeNotifier {
  ChatLog clog = ChatLog(id: 1, friend: User());
  void loadinglog(ChatLog value) {
    clog = value;
    notifyListeners();
  }
}