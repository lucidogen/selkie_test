import '../../../nandi/nandi.dart';

import '../counter.dart';
import '../../../app.dart';

class Count extends View {
  @override
  View render() {
    final state = app.state<Counter>(this);
    return Text(text: state.count.toString());
  }
}
