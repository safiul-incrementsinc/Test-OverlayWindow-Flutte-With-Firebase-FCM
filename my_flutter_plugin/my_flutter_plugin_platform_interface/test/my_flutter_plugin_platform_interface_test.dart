import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_plugin_platform_interface/my_flutter_plugin_platform_interface.dart';

class MyFlutterPluginMock extends MyFlutterPluginPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String?> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('MyFlutterPluginPlatformInterface', () {
    late MyFlutterPluginPlatform myFlutterPluginPlatform;

    setUp(() {
      myFlutterPluginPlatform = MyFlutterPluginMock();
      MyFlutterPluginPlatform.instance = myFlutterPluginPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await MyFlutterPluginPlatform.instance.getPlatformName(),
          equals(MyFlutterPluginMock.mockPlatformName),
        );
      });
    });
  });
}
