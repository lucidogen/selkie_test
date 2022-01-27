import 'package:flutter/cupertino.dart';

import '../selkie.dart';
import '../selkie_widget.dart';

class SFlexible extends SelkieWidget{

  SFlexible({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final layout = connect(context);
    return Flexible(
        child: render(layout.child));
  }

}