import './features/counter/counter.dart';
import './features/home.dart';
import './nandi/app.dart';

final app = App(root: Home(), features: [CounterFeature()]);
