import '../view.dart';
export '../view.dart';

typedef ActionTrigger = List<View> Function();

class Action extends View {
  final ActionTrigger action;
  final String type;
  Action({required this.action, required View child, required this.type}) {
    child.parent = this;
    children = [child];
  }

  @override
  View render() {
    return this;
  }

  @override
  View renderAndCapture() => render();

  @override
  Action? findAction(int id) => id == this.id ? this : null;

  @override
  dynamic serialize() => {"i": id, "p": type, "c": children[0].serialize()};
}
