import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_plugin_ios/my_flutter_plugin_ios.dart';
import 'package:my_flutter_plugin_platform_interface/my_flutter_plugin_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MyFlutterPluginIOS', () {
    const kPlatformName = 'iOS';
    late MyFlutterPluginIOS myFlutterPlugin;
    late List<MethodCall> log;

    setUp(() async {
      myFlutterPlugin = MyFlutterPluginIOS();

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
      MyFlutterPluginIOS.registerWith();
      expect(MyFlutterPluginPlatform.instance, isA<MyFlutterPluginIOS>());
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
