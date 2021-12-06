import '../view.dart';

class Container extends View {
  final int background;
  final int color;
  Container(
      {required View child,
      this.background = 0xFFFFFFFF,
      this.color = 0xFF000000}) {
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
  dynamic serialize() => {
        "i": id,
        "p": "container",
        "s": {"background": background, "color": color},
        "c": children[0].serialize()
      };
}
