import 'package:flutter/material.dart';

class LoadContent extends StatelessWidget {
  const LoadContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Center(
        child: SizedBox(
          width: 45,
          height: 45,
          child: CircularProgressIndicator(strokeWidth: 3.0),
        ),
      ),
    );
  }
}
