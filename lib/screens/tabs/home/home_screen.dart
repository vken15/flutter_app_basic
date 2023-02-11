import 'package:flutter/material.dart';
import 'package:my_first_app/bloc/load_content_bloc.dart';
import 'package:my_first_app/constants.dart';
import 'package:my_first_app/event/load_browes_all_content_event.dart';
import 'package:my_first_app/event/load_today_new_content_event.dart';
import 'package:my_first_app/model/content.dart';
import 'package:my_first_app/providers/content_provider.dart';
import 'package:my_first_app/screens/tabs/content_screen.dart';
import 'package:my_first_app/screens/widget/build_avatar.dart';
import 'package:my_first_app/screens/widget/build_title.dart';
import 'package:my_first_app/screens/widget/load_content.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  bool get wantKeepAlive => true;
  final _contentbloc1 = LoadContentBloc();
  final _contentbloc2 = LoadContentBloc();

  @override
  void initState() {
    super.initState();
    _contentbloc1.event.add(LoadBrowesAllContentEvent());
    _contentbloc2.event.add(LoadTodayNewContentEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _contentbloc1.dispose();
    _contentbloc2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const BuildTitle(text: "Discover", size: titleLsize),
          const SizedBox(height: 30),
          const BuildTitle(text: "WHAT'S NEW TODAY", size: titleSsize),
          _buildTodayNew(),
          const SizedBox(height: 30),
          const BuildTitle(text: "BROWSE ALL", size: titleSsize),
          _buildBrowesAll(),
          _buildOutlineButton(),
        ],
      ),
    );
  }

  Widget _buildOutlineButton() {
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
        onPressed: () {
          _contentbloc1.event.add(LoadBrowesAllContentEvent());
        },
        child: const Text("SEE MORE"),
      ),
    );
  }

  Widget _buildBrowesAll() {
    return SizedBox(
      child: StreamBuilder<List<Content>>(
          stream: _contentbloc1.contentListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 150.0,
                ),
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                itemCount: snapshot.data!.length,
                //itemCount: data.length + 1,
                itemBuilder: (context, int index) {
                  return //index >= data.length ? const LoadContent() :
                      _buildBrowesAllContent(context, snapshot.data![index]);
                },
              );
            } else {
              return const LoadContent();
            }
          }),
    );
  }

  Widget _buildTodayNew() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.47,
      child: StreamBuilder<List<Content>>(
          stream: _contentbloc2.contentListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildTodayNewContent(context, snapshot.data![index]);
                },
              );
            } else {
              return const LoadContent();
            }
          }),
    );
  }

  TextButton _buildTodayNewContent(BuildContext context, Content data) {
    return TextButton(
      onPressed: () {
        context.read<ContentProvider>().loadingcontent(data);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ContentScreen(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(data.image,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 0.38,
              width: MediaQuery.of(context).size.width * 0.9),
          BuildUserAva(
            avatar: data.avatar,
            username: data.username,
            name: data.name,
            fontcolor: defaultfontcolor,
          )
        ],
      ),
    );
  }

  TextButton _buildBrowesAllContent(BuildContext context, Content data) {
    return TextButton(
        onPressed: () {
          context.read<ContentProvider>().loadingcontent(data);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ContentScreen(),
            ),
          );
        },
        child: Image.asset(data.image, fit: BoxFit.fill));
  }
}
