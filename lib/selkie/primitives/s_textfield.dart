import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../selkie.dart';
import '../selkie_widget.dart';

class STextfield extends SelkieWidget {
  STextfield({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);

  @override
  Widget build(BuildContext context) {
    final layout = connect(context);
    final textController = layout.textfieldController;
    final textStyle= layout.style;

    return TextField(controller: textController.textController,
      style: TextStyle(color: textStyle.color,fontSize: textStyle.fontSize),

    );
  }
}