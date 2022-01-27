import 'package:flutter/cupertino.dart';

import '../layout.dart';
import '../selkie.dart';
import '../selkie_widget.dart';

class SSizedBox extends SelkieWidget {
  SSizedBox({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final layout = connect(context);
    return SizedBox(child: render(layout.child),
    height: layout.sizedBoxheight,
    width: layout.sizedBoxWidth,
    );
  }
}