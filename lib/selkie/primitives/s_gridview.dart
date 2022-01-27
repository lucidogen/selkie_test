import 'package:flutter/cupertino.dart';

import '../selkie.dart';
import '../selkie_widget.dart';

class SGridView extends SelkieWidget{

  SGridView({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final layout = connect(context);
    return GridView(
        scrollDirection: layout.listAxis,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: layout.gridAxisCount,),
        shrinkWrap: layout.swraplist,
        children:layout.children.map(render).toList());

  }

}