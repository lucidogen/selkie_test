import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../selkie.dart';
import '../selkie_widget.dart';

class SDivider extends SelkieWidget {
  SDivider({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final layout = connect(context);
    final style = layout.style;
    return Divider(color: style.color);
  }
}
