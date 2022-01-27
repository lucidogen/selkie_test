import 'package:flutter/material.dart';
import 'package:selkie_test/selkie/textController.dart';
import 'package:selkie_test/selkie/textStyleProperty.dart';

import 'style.dart';

// This is the type of data received as CBOR encoded binary data from
// the app state machine. Here we simply use the yaml data to simulate
// the content.
class Layout {
  final dynamic yaml;

  const Layout(this.yaml);

  int get id => yaml['i'];

  String get primitive => yaml['p'];

  String get text => yaml['text'];

  int get flex=> yaml['sflex'];

  //Sized box dynamic width and height parameters
  double get sizedBoxheight => yaml['sbheight'];
  double get sizedBoxWidth => yaml['sbwidth'];

  //wrap list

  bool get swraplist=> yaml['swrap'];

  //Grid Axis counnt

  int get gridAxisCount => yaml['gcount'];

  Style get style => Style(yaml['s']);
  TextStyleProperty get textStyle => TextStyleProperty(yaml['ts']);

  //Column dynamic Axis
  MainAxisAlignment get mainAxis {
    switch (yaml['mainAxis']) {
      case 'center':
        return MainAxisAlignment.center;
      default:
        return MainAxisAlignment.start;
    }
  }

  TextController get textfieldController => TextController(yaml['tc']);

  //Row dynamic axis
 CrossAxisAlignment get crossAxis {
    switch (yaml['crossAxis']) {
      case 'center':
        return CrossAxisAlignment.center;
      default:
        return CrossAxisAlignment.start;
    }
  }

  //Adjust image in container axis
  BoxFit get boxFit {
    switch (yaml['boxFit']) {
      case 'contain':
        return BoxFit.contain;
      default:
        return BoxFit.cover;
    }
  }

  //dynamic padding
  EdgeInsets get padding {
   switch(yaml['padding']){
     case '10':
       return const EdgeInsets.all(10);
     default:
       return const EdgeInsets.all(0);
   }
  }

  //list axis
  Axis get listAxis {
    switch(yaml['axis']){
      case 'horizontal':
        return Axis.horizontal;
      default:
        return Axis.vertical;
    }
  }

  IconData get icon{
   switch(yaml['icon']){
     case 'profile':
       return Icons.account_circle;
     default:
       return Icons.water_outlined;
   }
  }

  AlignmentDirectional get alignment {
    switch(yaml['padding']){
      case '10':
        return const AlignmentDirectional(10, 10);
      default:
        return const AlignmentDirectional(0, 0);
    }
  }

  Layout get child => Layout(yaml['c']);

  List<Layout> get children =>
      (yaml['cn'] as List<dynamic>).map((e) => Layout(e)).toList();
}
