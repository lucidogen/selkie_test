import '../../nandi/nandi.dart';

class Counter extends State {
  final CounterFeature feature;

  Counter(this.feature, Node dependant) : super(dependant);

  // State
  int get count => query('count', () => feature.count);

  // Actions
  List<View> increment() => feature.change(() => feature.count += 1);
}

// Feature is mutable and trigger side effects. They hold the actual
// values (or database, etc).
class CounterFeature extends Feature<Counter> {
  int count = 0;

  @override
  Counter builder(Node dependant) => Counter(this, dependant);

  @override
  Type get stateType => Counter;
}
