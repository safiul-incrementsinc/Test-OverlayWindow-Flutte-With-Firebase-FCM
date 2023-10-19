import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart';
import 'package:my_flutter_plugin_platform_interface/my_flutter_plugin_platform_interface.dart';

/// An implementation of [MyFlutterPluginPlatform] that uses method channels.
class MethodChannelMyFlutterPlugin extends MyFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_flutter_plugin');

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }

  @override
  Future<String?> multiTradingTest() {
    return methodChannel.invokeMethod<String>('test');
  }
}
