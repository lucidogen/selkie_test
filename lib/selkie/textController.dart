
import 'package:flutter/cupertino.dart';

class TextController{
final dynamic data;

 TextController(this.data);

  TextEditingController get textController{
    return TextEditingController(text: data['controllerValue']);
  }

}