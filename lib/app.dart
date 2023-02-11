import 'package:my_first_app/constants.dart';
import 'package:my_first_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primarycolor,
        textTheme: const TextTheme(
          bodyText2:
              TextStyle(color: defaultfontcolor, fontSize: defaultbfontsize),
        ),
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
