import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:my_first_app/base/base_bloc.dart';
import 'package:my_first_app/base/base_event.dart';
import 'package:my_first_app/event/load_chat_box_event.dart';
import 'package:my_first_app/event/submit_text_chatbot_event.dart';
import 'package:my_first_app/model/messenger.dart';
import 'package:my_first_app/model/chat_log.dart';
import 'package:my_first_app/model/user.dart';

class ChatBoxBloc extends BaseBloc {
  final StreamController<ChatLog> _chatLogStreamController =
      StreamController<ChatLog>();
      
  Stream<ChatLog> get chatlineDataStream =>
      _chatLogStreamController.stream;

  ChatLog _clog = ChatLog(id: 1, friend: User());
  TextEditingController inputtext = TextEditingController();
  
  _inputText(String text) {
    _clog.log.add(Messenger(id: 99, n: 1, text: text));
    _chatLogStreamController.sink.add(_clog);
  }

  _loadinglog(ChatLog value) {
    _clog = value;
    _chatLogStreamController.sink.add(_clog);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is SubmitTextChatBotEvent) {
      _inputText(event.text);
    }
    if (event is LoadChatBoxEvent) {
      _loadinglog(event.chatlog);
    }
  }

  @override
  void dispose() {
    _chatLogStreamController.close();
    super.dispose();
  }
}
