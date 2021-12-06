import 'package:flutter/material.dart';

import 'layout.dart';
import 'selkie.dart';

class Wrapper {
  Layout layout;
  Wrapper(this.layout);
}

abstract class SelkieWidget extends StatelessWidget {
  SelkieWidget({Key? key, required this.selkie, required Layout layout})
      : wrapper = Wrapper(layout),
        id = layout.id,
        super(key: key);

  // We use a wrapper just to make the (facepalm) type system of dart
  // ignore it's @immutable flag.
  final Wrapper wrapper;
  final int id;
  final Selkie selkie;

  Layout connect(BuildContext context) {
    selkie.register(context as Element);
    return wrapper.layout;
  }

  void action() {
    selkie.action(wrapper.layout.id);
  }

  // Syntax sugar
  Widget render(Layout layout) => selkie.render(layout);
}
