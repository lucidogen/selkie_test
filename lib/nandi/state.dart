import './node.dart';
import './query.dart';

/// Wraps a feature's state with a given dependant in order to
/// keep track of queries.
class State {
  final Node dependant;
  final Map<String, Query> queries = {};
  State(this.dependant);

  T query<T>(String name, Getter<T> getter) {
    final query = queries[name];
    if (query != null) {
      // Asking twice for the same state value does not create
      // new queries but uses cached value.
      return query.value;
    } else {
      // New query for value identified by 'name'
      final query = Query(getter);
      // Cache query and register for changed detection
      queries[name] = query;
      return query.value;
    }
  }

  // This is called by the feature when it changes. It returns true if
  // the state is stale.
  bool stale() {
    if (dependant.dirty) {
      return true;
    }
    for (final query in queries.values) {
      if (query.stale()) {
        dependant.markDirty();
        return true;
      }
    }
    return false;
  }
}
