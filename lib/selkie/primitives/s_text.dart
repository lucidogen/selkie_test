import 'package:flutter/material.dart';
import 'package:selkie_test/selkie/selkie_widget.dart';

import '../selkie.dart';

class SText extends SelkieWidget {
  SText({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);

  @override
  Widget build(BuildContext context) {
    final layout = connect(context);
    final style = layout.style;

    return Text(layout.text,
        style: TextStyle(
          fontSize: style.fontSize,
          color: style.color,
        ));
  }
}
