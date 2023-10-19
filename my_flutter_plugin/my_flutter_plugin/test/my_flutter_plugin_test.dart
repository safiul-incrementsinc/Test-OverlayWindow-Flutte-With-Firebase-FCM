import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_plugin/my_flutter_plugin.dart';
import 'package:my_flutter_plugin_platform_interface/my_flutter_plugin_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyFlutterPluginPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements MyFlutterPluginPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MyFlutterPlugin', () {
    late MyFlutterPluginPlatform myFlutterPluginPlatform;

    setUp(() {
      myFlutterPluginPlatform = MockMyFlutterPluginPlatform();
      MyFlutterPluginPlatform.instance = myFlutterPluginPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => myFlutterPluginPlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });

      test('throws exception when platform implementation is missing',
          () async {
        when(
          () => myFlutterPluginPlatform.getPlatformName(),
        ).thenAnswer((_) async => null);

        expect(getPlatformName, throwsException);
      });
    });
  });
}
