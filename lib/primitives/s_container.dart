import 'package:flutter/material.dart';
import 'package:selkie_test/render.dart';

class SContainer extends StatelessWidget {
  final dynamic layout;
  const SContainer({Key? key, required this.layout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(layout['s']['background']),
      child: render(layout['c']),
    );
  }
}
