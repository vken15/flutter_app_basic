import 'package:my_first_app/model/messenger.dart';
import 'package:my_first_app/model/user.dart';

class ChatLog {
  int _id;
  User _friend;
  List<Messenger> _log;
  
  int get id => _id;
  User get friend => _friend;
  List<Messenger> get log => _log;

  set setid(int value) {
    _id = value;
  }
  set setfriend(User value) {
    _friend = value;
  }
  set setlog(List<Messenger> value) {
    _log = value;
  }

  ChatLog({
    required int id,
    required User friend,
    List<Messenger> log = const <Messenger>[],
  })  : _id = id,
        _friend = friend,
        _log = log;
}