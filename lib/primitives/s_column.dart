import 'package:flutter/material.dart';
import 'package:selkie_test/render.dart';

class SColumn extends StatelessWidget {
  final dynamic layout;
  const SColumn({Key? key, required this.layout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic> children = layout['cn'];
    return Column(children: children.map(render).toList());
  }
}
