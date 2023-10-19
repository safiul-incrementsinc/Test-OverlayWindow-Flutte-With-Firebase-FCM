import 'package:my_flutter_plugin_platform_interface/src/method_channel_my_flutter_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of my_flutter_plugin must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `MyFlutterPlugin`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added [MyFlutterPluginPlatform] methods.
abstract class MyFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a MyFlutterPluginPlatform.
  MyFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static MyFlutterPluginPlatform _instance = MethodChannelMyFlutterPlugin();

  /// The default instance of [MyFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelMyFlutterPlugin].
  static MyFlutterPluginPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [MyFlutterPluginPlatform] when they register themselves.
  static set instance(MyFlutterPluginPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String?> getPlatformName();
}
