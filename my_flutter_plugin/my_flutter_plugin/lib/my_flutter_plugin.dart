import 'package:my_flutter_plugin_platform_interface/my_flutter_plugin_platform_interface.dart';

MyFlutterPluginPlatform get _platform => MyFlutterPluginPlatform.instance;

/// Returns the name of the current platform.
Future<String> getPlatformName() async {
  final platformName = await _platform.getPlatformName();
  if (platformName == null) throw Exception('Unable to get platform name.');
  return platformName;
}
