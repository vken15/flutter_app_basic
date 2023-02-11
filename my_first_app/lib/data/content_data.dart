import 'package:my_first_app/model/content.dart';

class ContentData {
  List<Content> getcontent() {
    List<Content> ds = <Content>[];
    ds.add(Content(
        avatar: "assets/icons/avatar.png",
        name: "ABC",
        username: "ABC",
        image: "assets/images/a1.jpg"));
    ds.add(Content(
        avatar: "assets/icons/avatar.png",
        name: "BCD",
        username: "BCD",
        image: "assets/images/a1.jpg"));
    ds.add(Content(
        avatar: "assets/icons/avatar.png",
        name: "ACC",
        username: "ACD",
        image: "assets/images/a1.jpg"));
    ds.add(Content(
        avatar: "assets/icons/avatar.png",
        name: "CDE",
        username: "CEE",
        image: "assets/images/a1.jpg"));
    return ds;
  }
}