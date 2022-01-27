import 'package:flutter/cupertino.dart';

import '../selkie.dart';
import '../selkie_widget.dart';

//Wrapper for Row component
class SRow extends SelkieWidget {
  SRow({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);

  @override
  Widget build(BuildContext context) {
    final layout = connect(context);

    return Row(
        crossAxisAlignment: layout.crossAxis,
        children: layout.children.map(render).toList());
  }
}