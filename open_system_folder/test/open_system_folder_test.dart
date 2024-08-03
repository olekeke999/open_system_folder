import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:open_system_folder_platform_interface/open_system_folder_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOpenSystemFolderPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements OpenSystemFolderPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('OpenSystemFolder', () {
    late OpenSystemFolderPlatform openSystemFolderPlatform;

    setUp(() {
      openSystemFolderPlatform = MockOpenSystemFolderPlatform();
      OpenSystemFolderPlatform.instance = openSystemFolderPlatform;
    });
  });
}
