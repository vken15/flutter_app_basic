import 'package:flutter/material.dart';
import 'package:my_first_app/constants.dart';
import 'package:my_first_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin<ProfileScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<UserProvider>(
      builder: (context, user, _) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                _buildAvatar(user.avatar),
                // name
                Text(
                  user.name,
                  style: const TextStyle(fontSize: titleMsize),
                ),
                // country
                const Text("fafdsf, sdfadsf"),
                _buildElevatedButton("FOLLOW"),
                _buildOutlineButton("MESSAGE"),
                _buildBrowesAll(),
                _buildOutlineButton("SEE MORE"),
              ],
            ),
          ),
        );
      },
    );
  }

  /// build a Avatar
  Widget _buildAvatar(String text) {
    return Center(
      child: CircleAvatar(radius: 50, backgroundImage: AssetImage(text)),
    );
  }

  /// build a ElevatedButton
  Widget _buildElevatedButton(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          primary: Colors.black,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }

  /// build a OutlineButton
  Widget _buildOutlineButton(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          primary: Colors.black,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          side: const BorderSide(width: 2.0, color: Colors.black),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }

  Widget _buildBrowesAll() {
    return SizedBox(
      child: GridView.builder(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 150.0,
        ),
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
              onPressed: () {},
              child: Image.asset("assets/images/a1.jpg", fit: BoxFit.fill));
        },
      ),
    );
  }
}
