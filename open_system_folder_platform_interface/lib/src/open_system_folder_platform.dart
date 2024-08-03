import 'package:open_system_folder_platform_interface/open_system_folder_platform_interface.dart';
import 'package:open_system_folder_platform_interface/src/method_channel_open_system_folder.dart';
import 'package:open_system_folder_platform_interface/src/model/system_folder.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of open_system_folder must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `OpenSystemFolder`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added [OpenSystemFolderPlatform] methods.
abstract class OpenSystemFolderPlatform extends PlatformInterface {
  /// Constructs a OpenSystemFolderPlatform.
  OpenSystemFolderPlatform() : super(token: _token);

  static final Object _token = Object();

  static OpenSystemFolderPlatform _instance = MethodChannelOpenSystemFolder();

  /// The default instance of [OpenSystemFolderPlatform] to use.
  ///
  /// Defaults to [MethodChannelOpenSystemFolder].
  static OpenSystemFolderPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [OpenSystemFolderPlatform] when they register themselves.
  static set instance(OpenSystemFolderPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Open system folder in OS. For iOS is uses Files app, for Android -
  /// some file manager app.
  /// [subPath] - nested path in your app's folder
  Future<void> openSystemFolder({
    required SystemFolder systemFolder,
    String? subPath,
  });
}
