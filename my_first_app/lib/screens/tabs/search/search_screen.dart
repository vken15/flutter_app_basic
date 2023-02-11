import 'package:flutter/material.dart';
import 'package:my_first_app/bloc/search_bloc.dart';
import 'package:my_first_app/constants.dart';
import 'package:my_first_app/event/search_event.dart';
import 'package:my_first_app/model/content.dart';
import 'package:my_first_app/providers/content_provider.dart';
import 'package:my_first_app/screens/tabs/content_screen.dart';
import 'package:my_first_app/screens/widget/build_title.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBloc>(builder: (context, sbloc, child) => 
      Column(
        children: [
          const BuildTitle(text: "Search", size: titleLsize),
          _buildSearchTextField(sbloc),
          StreamBuilder<List<Content>>(
            stream: sbloc.contentListStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Text("Khong tim thay");
                } else {
                  return _buildSearchAll(snapshot.data!);
                }
              } 
              else {
                return const Center();
                //return const LoadContent();
              }
            },
          )
        ],
      ),
    );
  }

  Padding _buildSearchTextField(SearchBloc sbloc) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          decoration: const InputDecoration(
            hintText: "Search all photos",
            enabledBorder: OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(width: 2)),
            errorBorder: OutlineInputBorder(),
            focusedErrorBorder:
                OutlineInputBorder(borderSide: BorderSide(width: 2)),
          ),
          onSubmitted: (value) {
            sbloc.event.add(SearchEvent(value));
          },
        ),
      );
  }

  Widget _buildSearchAll(List<Content> data) {
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
        itemCount: data.length,
        itemBuilder: (context, int index) {
          return _buildSearchAllContent(context, data[index]);
        },
      ),
    );
  }

  TextButton _buildSearchAllContent(BuildContext context, Content data) {
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
      child: Image.asset(data.image, fit: BoxFit.fill),
    );
  }
}
