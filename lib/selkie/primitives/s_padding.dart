
import 'package:flutter/cupertino.dart';

import '../selkie.dart';
import '../selkie_widget.dart';

class SPadding extends SelkieWidget {
  SPadding({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);

  @override
  Widget build(BuildContext context) {
    final layout = connect(context);
    return Padding(padding: layout.padding ,child: render(layout.child),);
  }
}