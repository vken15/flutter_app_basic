import 'package:flutter/material.dart';
import 'package:my_first_app/providers/content_provider.dart';
import 'package:provider/provider.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ContentProvider>(
        builder: (context, content, _) {
          return Stack(
            children: [
              Image.asset(content.image,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(content.avatar)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        Text(content.name,
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(content.username,
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white)),
                      ],
                    ),
                    const Spacer(),
                    CloseButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
