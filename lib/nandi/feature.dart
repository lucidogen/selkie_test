import './node.dart';
import './state.dart';
import './view.dart';

typedef Builder<T> = T Function(Node, Feature);

abstract class Feature<T extends State> extends Node {
  final Map<Node, State> states = {};

  T state(Node dependant) {
    final s = states[dependant];
    if (s != null) {
      return s as T;
    } else {
      return states[dependant] = builder(dependant);
    }
  }

  T builder(Node dependant);

  Type get stateType;

  List<View> change(Function mutate) {
    mutate();
    return changed();
  }

  void clearStateFromChildren(View view) {
    for (final child in view.children) {
      states.remove(child);
      clearStateFromChildren(child);
    }
  }

  List<View> changed() {
    // For each dependant
    final List<Node> dirty = [];
    for (final state in states.values) {
      if (state.stale()) {
        // Dependant need to re-render
        dirty.add(state.dependant);
      }
    }
    final List<View> dirtyViews = [];

    for (final node in dirty) {
      // Remove stale state from cache.
      states.remove(node);
      if (node.isView) {
        final view = node as View;
        if (!view.parentIsDirty) {
          // Do not re-render a dirty child if we render a dirty parent.
          dirtyViews.add(view);
          clearStateFromChildren(view);
        }
      }
    }
    return dirtyViews;
  }
}
