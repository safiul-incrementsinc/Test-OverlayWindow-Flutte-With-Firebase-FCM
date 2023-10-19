import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:test_bg_task/flutter_overlay_window/true_caller.dart';

gg() async {
  @pragma("vm:entry-point")
  void overlayMain() {
    DartPluginRegistrant.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();

    runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TrueCallerOverlay(),
      ),
    );
  }

  await FlutterOverlayWindow.showOverlay(
    enableDrag: true,
  );
}
