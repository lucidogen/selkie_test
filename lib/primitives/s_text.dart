import 'package:flutter/material.dart';

class SText extends StatelessWidget {
  final dynamic layout;
  const SText({Key? key, required this.layout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(layout['text']);
  }
}
