import 'package:flutter/cupertino.dart';

import '../selkie.dart';
import '../selkie_widget.dart';

class SExpanded extends SelkieWidget{

  SExpanded({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final layout = connect(context);
    return Expanded(
        flex:layout.flex,
        child: render(layout.child));
  }

}