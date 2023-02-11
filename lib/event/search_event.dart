import 'package:my_first_app/base/base_event.dart';

class SearchEvent extends BaseEvent {
  String text;
  SearchEvent(this.text);
}