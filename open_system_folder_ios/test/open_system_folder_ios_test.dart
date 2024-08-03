import 'package:flutter_test/flutter_test.dart';
import 'package:open_system_folder_ios/open_system_folder_ios.dart';
import 'package:open_system_folder_platform_interface/open_system_folder_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('OpenSystemFolderIOS', () {
    test('can be registered', () {
      OpenSystemFolderIOS.registerWith();
      expect(OpenSystemFolderPlatform.instance, isA<OpenSystemFolderIOS>());
    });
  });
}
