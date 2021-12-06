import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:selkie_test/app.dart';

import './selkie_widget.dart';
import './primitives/s_column.dart';
import './primitives/s_container.dart';
import './primitives/s_tap_action.dart';
import './primitives/s_widget.dart';
import './primitives/s_text.dart';
import './layout.dart';

export './layout.dart';
export './selkie_widget.dart';

class Selkie {
  Selkie();

  final Map<int, Element> elements = {};
  Map<int, Layout> layouts = {};

  void register(Element element) {
    final widget = element.widget as SelkieWidget;
    elements[widget.id] = element;
  }

  void receive(dynamic data) {
    for (final change in data['changed']) {
      final layout = Layout(change);
      final el = elements[layout.id];
      if (el != null) {
        final widget = el.widget as SelkieWidget;
        widget.wrapper.layout = layout;
        el.markNeedsBuild();
      } else {
        print('ERROR Widget ${layout.id} not found.');
      }
    }
  }

  // Simulate Garuda action
  void action(int id) {
    final json = app.action(id);
    print(json);
    receive(jsonDecode(json));
  }

  Widget render(Layout layout) {
    switch (layout.primitive) {
      case 'container':
        return SContainer(selkie: this, layout: layout);
      case 'column':
        return SColumn(selkie: this, layout: layout);
      case 'tap_action':
        return STapAction(selkie: this, layout: layout);
      case 'text':
        return SText(selkie: this, layout: layout);
      case 'widget':
        return SWidget(selkie: this, layout: layout);
      default:
        return Text("Invalid primitive '${layout.primitive}'");
    }
  }
}
