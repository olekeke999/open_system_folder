import 'package:open_system_folder/src/system_folder.dart';
import 'package:open_system_folder_platform_interface/open_system_folder_platform_interface.dart'
    as osf;

osf.OpenSystemFolderPlatform get _platform =>
    osf.OpenSystemFolderPlatform.instance;

/// Opens system folder with default File Manager.
/// The [systemFolder] - opens required system folder
/// The [subPath] opens child folder by path
///
/// example:
/// [systemFolder] = [SystemFolder.downloads]
/// [subPath] = ["my folder/pictures"]
/// The full path: ***/Downloads/my folder/pictures
Future<void> openSystemFolder({
  required SystemFolder systemFolder,
  String? subPath,
}) async {
  await _platform.openSystemFolder(
    systemFolder: systemFolder.mapToPlatform(),
    subPath: subPath,
  );
}

extension _SystemFolderMapper on SystemFolder {
  osf.SystemFolder mapToPlatform() => switch (this) {
        SystemFolder.documents => osf.SystemFolder.documents,
        SystemFolder.downloads => osf.SystemFolder.downloads,
      };
}
