import 'package:my_first_app/base/base_event.dart';
import 'package:my_first_app/model/chat_log.dart';

class LoadChatBoxEvent extends BaseEvent {
  ChatLog chatlog;
  LoadChatBoxEvent(this.chatlog);
}