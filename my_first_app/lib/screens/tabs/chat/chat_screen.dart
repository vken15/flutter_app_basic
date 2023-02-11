import 'package:flutter/material.dart';
import 'package:my_first_app/bloc/chatbox_bloc.dart';
import 'package:my_first_app/constants.dart';
import 'package:my_first_app/providers/chat_provider.dart';
import 'package:my_first_app/providers/chatbox_provider.dart';
import 'package:my_first_app/screens/tabs/chat/chatbox_screen.dart';
import 'package:my_first_app/screens/widget/build_avatar.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Center(
            child: Text(
              "Chats",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ChatListView(),
        ],
      ),
    );
  }
}

class ChatListView extends StatefulWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  ChatListViewState createState() => ChatListViewState();
}

class ChatListViewState extends State<ChatListView> {
  final chatbloc = ChatBoxBloc();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Consumer<ChatProvider>(
        builder: (context, chat, _) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            itemCount: chat.ds.length,
            itemBuilder: (BuildContext context, int index) {
              return TextButton(
                onPressed: () {
                  context.read<ChatBoxProvider>().loadinglog(chat.ds[index]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Provider(create: (_) => ChatBoxBloc(), child: const ChatBox()),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BuildUserAva(
                          avatar: chat.ds[index].friend.avatar,
                          username: chat.ds[index].friend.username,
                          name: chat.ds[index].friend.name,
                          fontcolor: defaultfontcolor),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
