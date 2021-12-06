import 'package:flutter/material.dart';
import 'package:selkie_test/selkie/selkie_widget.dart';

import '../selkie.dart';

/// This is the class for real widgets (not primitives). We have this
/// wrapper so that we can re-render
class SWidget extends SelkieWidget {
  SWidget({Key? key, required Selkie selkie, required Layout layout})
      : super(key: key, selkie: selkie, layout: layout);

  @override
  Widget build(BuildContext context) {
    final layout = connect(context);
    return render(layout.child);
  }
}
