import 'package:flutter/material.dart';

import 'style.dart';

// This is the type of data received as CBOR encoded binary data from
// the app state machine. Here we simply use the yaml data to simulate
// the content.
class Layout {
  final dynamic yaml;

  const Layout(this.yaml);

  int get id => yaml['i'];

  String get primitive => yaml['p'];

  String get text => yaml['text'];

  Style get style => Style(yaml['s']);

  MainAxisAlignment get mainAxis {
    switch (yaml['mainAxis']) {
      case 'center':
        return MainAxisAlignment.center;
      default:
        return MainAxisAlignment.start;
    }
  }

  Layout get child => Layout(yaml['c']);

  List<Layout> get children =>
      (yaml['cn'] as List<dynamic>).map((e) => Layout(e)).toList();
}
