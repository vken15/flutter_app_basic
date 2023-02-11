import 'package:flutter/material.dart';
import 'package:my_first_app/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLogOutButton(context),
        ],
      ),
    );
  }

  Container _buildLogOutButton(BuildContext context) {
    return Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              context.read<ChatProvider>().dispose();
              Navigator.pop(context);
            },
            child: const Text("Log out"),
          ),
        );
  }
}
