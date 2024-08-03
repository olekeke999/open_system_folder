import 'package:flutter_test/flutter_test.dart';
import 'package:open_system_folder_android/open_system_folder_android.dart';
import 'package:open_system_folder_platform_interface/open_system_folder_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('can be registered', () {
    OpenSystemFolderAndroid.registerWith();
    expect(OpenSystemFolderPlatform.instance, isA<OpenSystemFolderAndroid>());
  });
}
