import 'package:flutter/material.dart';

import '../selkie.dart';

class SColumn extends SelkieWidget {
  SColumn({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);

  @override
  Widget build(BuildContext context) {
    final layout = connect(context);

    return Column(
        mainAxisAlignment: layout.mainAxis,
        children: layout.children.map(render).toList());
  }
}
