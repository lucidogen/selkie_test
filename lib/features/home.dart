import 'package:selkie_test/features/counter/views/increment.dart';

import '../nandi/nandi.dart';

import './counter/views/count.dart';

class Home extends View {
  @override
  View render() {
    return Container(
        background: 0xFF333333,
        color: 0xFFEEEEEE,
        child: Column(
          mainAxis: 'center',
          children: [
            // A sub-view from Counter feature
            Count(),
            // Another sub-view with an action
            Increment(),
          ],
        ));
  }
}
