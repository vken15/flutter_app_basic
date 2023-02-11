import 'package:my_first_app/model/messenger.dart';
import 'package:my_first_app/model/chat_log.dart';
import 'package:my_first_app/model/user.dart';

class ChatLogData {
  List<ChatLog> getcontent() {
    List<ChatLog> ds = <ChatLog>[];
    ds.add(ChatLog(
      id: 1,
      friend:
          User(name: "BCD", username: "B", pass: "123"),
      log: [Messenger(id: 1,n: 1,text: "aeowjoawgjewaigj"),Messenger(id: 2,n: 2,text: "bieajoiea")],
    ));
    ds.add(ChatLog(
      id: 2,
      friend:
          User(name: "DDD", username: "C", pass: "123"),
      log: []
    ));
    ds.add(ChatLog(
      id: 3,
      friend:
          User(name: "EEE", username: "D", pass: "123"),
      log: []
    ));
    return ds;
  }
}
