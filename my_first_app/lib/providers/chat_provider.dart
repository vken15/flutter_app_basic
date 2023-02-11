import 'package:my_first_app/data/chat_list_data.dart';
import 'package:my_first_app/model/chat_log.dart';

class ChatProvider  {
  ///tam thoi
  List<ChatLog> ds = <ChatLog>[];
  void loadinglist() {
    ds.addAll(ChatLogData().getcontent());
  }

  void dispose() {
    ds.clear();
  }
}