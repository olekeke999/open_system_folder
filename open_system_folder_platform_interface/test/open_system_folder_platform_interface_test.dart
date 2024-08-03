import 'package:flutter_test/flutter_test.dart';

import 'package:open_system_folder_platform_interface/src/model/system_folder.dart';
import 'package:open_system_folder_platform_interface/src/open_system_folder_platform.dart';

class OpenSystemFolderMock extends OpenSystemFolderPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<void> openSystemFolder({
    required SystemFolder systemFolder,
    String? subPath,
  }) async {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('OpenSystemFolderPlatformInterface', () {
    late OpenSystemFolderPlatform openSystemFolderPlatform;

    setUp(() {
      openSystemFolderPlatform = OpenSystemFolderMock();
      OpenSystemFolderPlatform.instance = openSystemFolderPlatform;
    });
  });
}
