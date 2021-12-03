import 'package:flutter/material.dart';
import 'package:selkie_test/render.dart';

class STapAction extends StatelessWidget {
  final dynamic layout;
  const STapAction({Key? key, required this.layout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('Tap on id: ${layout['i']}');
        },
        child: render(layout['c']));
  }
}
