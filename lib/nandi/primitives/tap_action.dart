import './action.dart';

class TapAction extends Action {
  TapAction({required ActionTrigger action, required View child})
      : super(action: action, child: child, type: 'tap_action');
}
