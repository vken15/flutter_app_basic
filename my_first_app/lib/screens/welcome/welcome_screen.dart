import 'package:flutter/material.dart';
import 'package:my_first_app/bloc/login_bloc.dart';
import 'package:my_first_app/bloc/register_bloc.dart';
import 'package:my_first_app/constants.dart';
import 'package:my_first_app/screens/login/login_screen.dart';
import 'package:my_first_app/screens/register/register_screen.dart';
import 'package:my_first_app/screens/widget/build_avatar.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Image.asset(welcomeImg, fit: BoxFit.contain),
                const Center(
                    child: Text("Demo",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
                _buildUser(),
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildLoginButton(context),
                  _buildRegisterButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlinedButton _buildLoginButton(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        side: const BorderSide(width: 2.0, color: Colors.black),
      ),
      onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => Provider(create: (_) => LoginBloc(), child: const LoginScreen()))),
      child: const Text("LOG IN"),
    );
  }

  ElevatedButton _buildRegisterButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Provider(create: (_) => RegisterBloc(), child: const RegisterScreen()))),
      child: const Text("REGISTER"),
    );
  }

  Widget _buildUser() {
    return const Positioned(
      left: 0,
      bottom: 0,
      child: Padding(
        padding: EdgeInsets.only(left: 20, bottom: 20),
        child: BuildUserAva(
          avatar: "assets/icons/avatar.png",
          username: "@ABC",
          name: "Nguyen Dang Khoa",
          fontcolor: Colors.white,
        ),
      ),
    );
  }
}
