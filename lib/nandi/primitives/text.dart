import '../view.dart';

class Text extends View {
  final String text;
  Text({required this.text});

  @override
  View render() {
    return this;
  }

  @override
  View renderAndCapture() => render();

  @override
  dynamic serialize() => {
        "i": id,
        "p": "text",
        "text": text,
        // Style should be added from theme / on construction. Keeping this
        // simple for now.
        "s": {"fontSize": 18.0, "color": 0xFFEEEEEE}
      };
}
