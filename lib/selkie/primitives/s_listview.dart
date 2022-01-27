import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:selkie_test/selkie/selkie.dart';

class SListView extends SelkieWidget{

  SListView({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final layout = connect(context);
    return ListView(
        scrollDirection: layout.listAxis,
        children:layout.children.map(render).toList(growable: true));
  }

}