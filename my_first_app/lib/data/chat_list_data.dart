import 'package:my_first_app/model/messenger.dart';
import 'package:my_first_app/model/chat_log.dart';
import 'package:my_first_app/model/user.dart';

class ChatLogData {
  List<ChatLog> getcontent() {
    List<ChatLog> ds = <ChatLog>[];
    ds.add(ChatLog(
      id: 1,
      friend:
          User(avatar: "assets/icons/avatar.png", name: "BCD", username: "B"),
      log: [Messenger(id: 1,n: 1,text: "aeowjoawgjewaigj"),Messenger(id: 2,n: 2,text: "bieajoiea")],
    ));
    ds.add(ChatLog(
      id: 2,
      friend:
          User(avatar: "assets/icons/avatar.png", name: "DDD", username: "C"),
      log: []
    ));
    ds.add(ChatLog(
      id: 3,
      friend:
          User(avatar: "assets/icons/avatar.png", name: "EEE", username: "D"),
      log: []
    ));
    return ds;
  }
}
