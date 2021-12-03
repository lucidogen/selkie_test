import 'package:flutter/material.dart';

import './primitives/s_column.dart';
import './primitives/s_container.dart';
import './primitives/s_tap_action.dart';
import './primitives/s_text.dart';

Widget render(dynamic layout) {
  switch (layout['p']) {
    case 'Container':
      return SContainer(layout: layout);
    case 'Column':
      return SColumn(layout: layout);
    case 'TapAction':
      return STapAction(layout: layout);
    case 'Text':
      return SText(layout: layout);
    default:
      return Text("Invalid primitive '${layout['p']}'");
  }
}
