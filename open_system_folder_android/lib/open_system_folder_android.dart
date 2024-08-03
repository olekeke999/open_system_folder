import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:open_system_folder_platform_interface/open_system_folder_platform_interface.dart';

/// The Android implementation of [OpenSystemFolderPlatform].
class OpenSystemFolderAndroid extends OpenSystemFolderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel('ole.keke/open_system_folder_android');

  /// Registers this class as the default instance of [OpenSystemFolderPlatform]
  static void registerWith() {
    OpenSystemFolderPlatform.instance = OpenSystemFolderAndroid();
  }

  @override
  Future<void> openSystemFolder({
    required SystemFolder systemFolder,
    String? subPath,
  }) {
    return methodChannel.invokeMethod<String>(
      'openSystemFolder',
      {
        systemFolderKey: systemFolder.folderName,
        subPathKey: subPath,
      },
    );
  }
}
