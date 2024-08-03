# open_system_folder

Flutter plugin to open system folder in the File Manager.

## Introduction

When you store user files in the file system, and you don't want to write custom UI to manage these files - you can just open a system default File Manager app and let user to look, copy, share or delete content there.

Android supported folders:

- Download (less than Android 10)
- Documents (Android 10+)

iOS supported folders:

as iOS doesn't have system folders, it always opens your app's documents folder.

## Getting started

find `pubspec.yaml` in your project and add this line under `dependencies:`:

```dart
import 'package:open_system_folder/open_system_folder.dart';
```

## Android

### setup

No additional setup required.

### code example

```dart
// opens Documents folder in the Android's default file manager app
await openSystemFolder(systemFolder: SystemFolder.documents);

// opens Documents/Some/One folder in the Android's default file manager app
await openSystemFolder(systemFolder: SystemFolder.documents, subPath: 'Some/One');
```

## iOS

### setup

add `UISupportsDocumentBrowser` to your `Info.plist` file and set `YES` value to it - it allows your app's Documents folder to be discovered by `Files` app. Without this, you won't be able to see your app in the Documents folder in the Files app.

### code example

```dart
// opens YourApp's folder in the Files app
await openSystemFolder(systemFolder: SystemFolder.documents);

// opens YourApp/Some/One folder in the the Files app
await openSystemFolder(systemFolder: SystemFolder.documents, subPath: 'Some/One');
```

## tips how to create files in system folders

### Download folder

**Android:**
before accessing files, for SDK < 13 you should use [https://pub.dev/packages/permission_handler](https://pub.dev/packages/permission_handler) before accessing file/folder.
You also need to update your manifest with:

```xml
<application 
    ...
    android:requestLegacyExternalStorage="true"
  >
```

```xml
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

`Download` folder is assessible by `/storage/emulated/0/Download/`.

**iOS:** consider using `getApplicationDocumentsDirectory` from [path_provider](https://pub.dev/packages/path_provider)

### Documents folder

TBD

## Future plans

1. Android has different system folders by versions. Looks like `Download` folder is stable, but `Documents` or any other possible folders (video, images, etc) could be missed. So I want to figure out what can be supported.
2. TBD

## Changelog

Please see the [Changelog](https://github.com/olekeke999/open_system_folder/tree/main/CHANGELOG.md) page to know what's recently changed.

## Contributions

for bugs - please fill an [issue](https://github.com/olekeke999/open_system_folder/issues).
you can also fix/improve something yourself and create a [pull request](https://github.com/olekeke999/open_system_folder/pulls).
