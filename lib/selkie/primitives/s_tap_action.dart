import 'package:flutter/material.dart';

import '../selkie_widget.dart';
import '../selkie.dart';
import '../layout.dart';

class STapAction extends SelkieWidget {
  STapAction({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);

  @override
  Widget build(BuildContext context) {
    final layout = connect(context);
    return GestureDetector(onTap: action, child: render(layout.child));
  }
}
