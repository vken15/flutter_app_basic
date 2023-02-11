import 'package:flutter/material.dart';
import 'package:my_first_app/bloc/search_bloc.dart';
import 'package:my_first_app/providers/chat_provider.dart';
import 'package:my_first_app/screens/tabs/chat/chat_screen.dart';
import 'package:my_first_app/screens/tabs/home/home_screen.dart';
import 'package:my_first_app/screens/tabs/profile/profile_screen.dart';
import 'package:my_first_app/screens/tabs/search/search_screen.dart';
import 'package:my_first_app/screens/tabs/settings/settings_screen.dart';
import 'package:provider/provider.dart';

class Tabbars extends StatefulWidget {
  const Tabbars({Key? key}) : super(key: key);

  @override
  TabbarsState createState() => TabbarsState();
}

class TabbarsState extends State<Tabbars> with TickerProviderStateMixin {
  static const List<Tab> mytabs = <Tab>[
    Tab(
      icon: Icon(
        Icons.home,
        color: Colors.red,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.search,
        color: Colors.red,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.chat_bubble,
        color: Colors.red,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.person,
        color: Colors.red,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.settings,
        color: Colors.red,
      ),
    ),
  ];

  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: mytabs.length, vsync: this);
    context.read<ChatProvider>().loadinglist();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white24,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          const HomeScreen(),
          Provider(create: (_) => SearchBloc(), child: const SearchScreen()),
          const ChatScreen(),
          const ProfileScreen(),
          const SettingScreen()
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: mytabs,
      ),
    );
  }
}
