import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart';
import 'package:open_system_folder_platform_interface/src/model/consts.dart';
import 'package:open_system_folder_platform_interface/src/model/system_folder.dart';
import 'package:open_system_folder_platform_interface/src/open_system_folder_platform.dart';

/// An implementation of [OpenSystemFolderPlatform] that uses method channels.
class MethodChannelOpenSystemFolder extends OpenSystemFolderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ole.keke/open_system_folder');

  @override
  Future<void> openSystemFolder({
    required SystemFolder systemFolder,
    String? subPath,
  }) {
    return methodChannel.invokeMethod<String>(
      methodChannelName,
      subPath != null ? {subPathKey: subPath} : null,
    );
  }
}
