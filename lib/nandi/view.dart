import './primitives/action.dart';
import './node.dart';

int nextId = 0;

abstract class View extends Node {
  int id;
  List<View> children = [];
  View? parent;
  View() : id = ++nextId;

  @override
  bool get isView => true;

  bool get parentIsDirty =>
      parent != null ? (parent!.dirty || parent!.parentIsDirty) : false;

  // Overwritten by primitives.
  View renderAndCapture() {
    print('render $id');
    final view = render();
    view.parent = this;
    children = [view];
    return view;
  }

  View render();

  /// Traverse the tree depth-first, until the view (action) with the given
  /// id is found. Overwritten in Action.
  Action? findAction(int id) {
    for (final child in children) {
      final action = child.findAction(id);
      if (action != null) {
        return action;
      }
    }
    return null;
  }

  // This only needs to be implemented by primitives
  dynamic serialize() =>
      {"i": id, "p": "widget", "c": renderAndCapture().serialize()};
}
