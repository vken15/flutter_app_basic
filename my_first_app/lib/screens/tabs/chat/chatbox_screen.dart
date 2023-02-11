import 'package:flutter/material.dart';
import 'package:my_first_app/bloc/chatbox_bloc.dart';
import 'package:my_first_app/event/load_chat_box_event.dart';
import 'package:my_first_app/event/submit_text_chatbot_event.dart';
import 'package:my_first_app/model/chat_log.dart';
import 'package:my_first_app/providers/chatbox_provider.dart';
import 'package:my_first_app/screens/widget/load_content.dart';
import 'package:provider/provider.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Consumer<ChatBoxBloc>(
        builder: (context, chatbloc, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _buildChatContent(context, chatbloc)),
            _buildTextComposer(context, chatbloc),
          ],
        ),
      ),
    );
  }

  Widget _buildChatContent(BuildContext context, ChatBoxBloc chatbloc) {
    chatbloc.event.add(LoadChatBoxEvent(context.watch<ChatBoxProvider>().clog));
    return StreamBuilder<ChatLog>(
      stream: chatbloc.chatlineDataStream,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return ListView.separated(
              itemCount: snapshot.data!.log.length,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return Align(
                  alignment: snapshot.data!.log[index].n % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: Text(snapshot.data!.log[index].text),
                  ),
                );
              },
            );
          case ConnectionState.none:
          default:
            return const LoadContent();
        }
      },
    );
  }

  /// build a text composer
  Widget _buildTextComposer(BuildContext context, ChatBoxBloc chatbloc) {
    return Container(
      color: Colors.white,
      child: TextField(
        controller: chatbloc.inputtext,
        onSubmitted: (value) {
          chatbloc.event.add(SubmitTextChatBotEvent(value));
          chatbloc.inputtext.clear();
        },
        textInputAction: TextInputAction.send,
        decoration: const InputDecoration(
          hintText: " Type Text",
        ),
      ),
    );
  }
}
