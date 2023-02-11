import 'dart:async';

import 'package:my_first_app/base/base_bloc.dart';
import 'package:my_first_app/base/base_event.dart';
import 'package:my_first_app/event/load_browes_all_content_event.dart';
import 'package:my_first_app/event/load_today_new_content_event.dart';
import 'package:my_first_app/model/content.dart';
import 'package:my_first_app/data/content_data.dart';

class LoadContentBloc extends BaseBloc {
  final StreamController<List<Content>> _contentListStreamController = StreamController<List<Content>>();

  Stream<List<Content>> get contentListStream => _contentListStreamController.stream;
  
  final List<Content> _contentListData = <Content>[];
  
  _loadcontent1() {
    _contentListData.addAll(ContentData().getcontent());
    _contentListStreamController.sink.add(_contentListData);
  }

  _loadcontent2() async {
    await Future.delayed(const Duration(seconds: 1));
    _contentListData.addAll(ContentData().getcontent());
    _contentListStreamController.sink.add(_contentListData);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is LoadTodayNewContentEvent) {
      _contentListData.clear();
      _loadcontent1();
    }
    if (event is LoadBrowesAllContentEvent) {
      //_contentListData.clear();
      _loadcontent2();
    }
  }

  @override
  void dispose() {
    _contentListStreamController.close();
    _contentListData.clear();
    super.dispose();
  }
}