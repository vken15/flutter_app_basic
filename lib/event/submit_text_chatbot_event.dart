import 'package:my_first_app/base/base_event.dart';

class SubmitTextChatBotEvent extends BaseEvent {
  String text;
  SubmitTextChatBotEvent(this.text);
}