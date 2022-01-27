import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:selkie_test/selkie/selkie.dart';

class SIconButton extends SelkieWidget{

  SIconButton( {Key? key, required Selkie selkie, required Layout layout })
      : super(key: key, selkie: selkie, layout: layout);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final layout = connect(context);
   return Icon(layout.icon);
  }

}
