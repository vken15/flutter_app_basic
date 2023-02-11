import 'dart:async';

import 'package:my_first_app/base/base_bloc.dart';
import 'package:my_first_app/base/base_event.dart';
import 'package:my_first_app/event/search_event.dart';
import 'package:my_first_app/model/content.dart';

class SearchBloc extends BaseBloc {
  final StreamController<List<Content>> _contentListStreamController = StreamController<List<Content>>();

  Stream<List<Content>> get contentListStream => _contentListStreamController.stream;

  final List<Content> _contentListData = <Content>[];

  _search(String text) {
    if (text == "123") {
      _contentListData.add(Content(avatar: "assets/icons/avatar.png",image: "assets/images/a1.jpg",name: "K",username: "ABC"));
    }
    _contentListStreamController.sink.add(_contentListData);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is SearchEvent) {
      _contentListData.clear();
      _search(event.text);
    }
  }

  @override
  void dispose() {
    _contentListStreamController.close();
    _contentListData.clear();
    super.dispose();
  }
}