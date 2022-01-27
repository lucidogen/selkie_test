
import 'package:flutter/cupertino.dart';

import '../selkie.dart';
import '../selkie_widget.dart';

class SImageAsset extends SelkieWidget {
  SImageAsset({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);

  @override
  Widget build(BuildContext context) {
    final layout = connect(context);

    return Image.asset(layout.text,fit:layout.boxFit ,);
  }
}