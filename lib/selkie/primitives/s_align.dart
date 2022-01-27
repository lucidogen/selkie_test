import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:selkie_test/selkie/selkie.dart';

class SAlign extends SelkieWidget {
  SAlign({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final layout = connect(context);
    return Align(alignment: layout.alignment, child: render(layout.child));
  }
}
