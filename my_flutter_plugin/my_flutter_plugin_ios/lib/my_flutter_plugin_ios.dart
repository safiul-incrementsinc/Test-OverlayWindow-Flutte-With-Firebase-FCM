import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_plugin_platform_interface/my_flutter_plugin_platform_interface.dart';

/// The iOS implementation of [MyFlutterPluginPlatform].
class MyFlutterPluginIOS extends MyFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_flutter_plugin_ios');

  /// Registers this class as the default instance of [MyFlutterPluginPlatform]
  static void registerWith() {
    MyFlutterPluginPlatform.instance = MyFlutterPluginIOS();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
