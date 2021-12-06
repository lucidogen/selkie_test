import '../view.dart';

class Column extends View {
  final String mainAxis;
  Column({required List<View> children, required this.mainAxis}) {
    this.children = children;
    for (final child in children) {
      child.parent = this;
    }
  }

  @override
  View render() {
    return this;
  }

  @override
  View renderAndCapture() => render();

  @override
  dynamic serialize() => {
        "i": id,
        "p": "column",
        "mainAxis": mainAxis,
        "cn": children.map((e) => e.serialize()).toList()
      };
}
