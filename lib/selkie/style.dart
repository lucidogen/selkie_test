import 'package:flutter/material.dart';

class Style {
  final dynamic data;

  const Style(this.data);

  double get fontSize {
    return data['fontSize'];
  }

  Color get background {
    return Color(data['background']);
  }

  Color get color {
    return Color(data['color']);
  }

  BoxDecoration get decoration{

    return BoxDecoration();
  }
}
