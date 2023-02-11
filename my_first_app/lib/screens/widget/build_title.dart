import 'package:flutter/material.dart';

class BuildTitle extends StatelessWidget {
  ///build a title
  const BuildTitle({
    required this.text,
    required this.size,
    Key? key,
  }) : super(key: key);

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(fontSize: size, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
