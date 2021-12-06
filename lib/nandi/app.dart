import 'dart:convert';

import 'primitives/action.dart';
import './feature.dart';
import './state.dart';
import './view.dart';
import './node.dart';

Map<Type, Feature> _mapFeatures(List<Feature> list) {
  final Map<Type, Feature> features = {};
  for (final feature in list) {
    features[feature.stateType] = feature;
  }
  return features;
}

class App {
  final Map<Type, Feature> _features;
  final View root;

  App({required this.root, required List<Feature> features})
      : _features = _mapFeatures(features);

  T state<T extends State>(Node dependant) {
    final feature = _features[T];
    if (feature == null) {
      throw 'Missing feature $T in app';
    }
    return feature.state(dependant) as T;
  }

  /// This is to simulate communication through Garuda channel.
  String init() {
    return jsonEncode({
      "changed": [root.serialize()]
    });
  }

  String action(int id) {
    print('Run action $id');
    final action = root.findAction(id);
    if (action == null) {
      print('Invalid action $id');
      // Something is really wrong. Redraw full app.
      return init();
    }
    return jsonEncode(
        {"changed": action.action().map((e) => e.serialize()).toList()});
  }
}
