import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_plugin_android/my_flutter_plugin_android.dart';
import 'package:my_flutter_plugin_platform_interface/my_flutter_plugin_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MyFlutterPluginAndroid', () {
    const kPlatformName = 'Android';
    late MyFlutterPluginAndroid myFlutterPlugin;
    late List<MethodCall> log;

    setUp(() async {
      myFlutterPlugin = MyFlutterPluginAndroid();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(myFlutterPlugin.methodChannel, (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      MyFlutterPluginAndroid.registerWith();
      expect(MyFlutterPluginPlatform.instance, isA<MyFlutterPluginAndroid>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await myFlutterPlugin.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
