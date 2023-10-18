import 'package:flutter/material.dart';
import 'package:system_alert_window/system_alert_window.dart';

@pragma('vm:entry-point')
void callBack(String tag) {
  WidgetsFlutterBinding.ensureInitialized();
  print(tag);
  switch (tag) {
    case "simple_button":
    case "updated_simple_button":
      SystemAlertWindow.closeSystemWindow(
          prefMode: SystemWindowPrefMode.OVERLAY);
      break;
    case "focus_button":
      print("Focus button has been called");
      break;
    case "spam_btn":
      print("spam_btn button has been called");
      break;
    default:
      print("OnClick event of $tag");
  }
}
