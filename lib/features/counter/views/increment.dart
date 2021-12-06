import '../../../nandi/nandi.dart';

import '../counter.dart';
import '../../../app.dart';

class Increment extends View {
  @override
  View render() {
    final state = app.state<Counter>(this);
    return TapAction(action: state.increment, child: Text(text: 'increment'));
  }
}
