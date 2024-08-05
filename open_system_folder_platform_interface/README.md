# open_system_folder_platform_interface

A common platform interface for the [`open_system_folder`][1] plugin.

This interface allows platform-specific implementations of the `open_system_folder`
plugin, as well as the plugin itself, to ensure they are supporting the
same interface.

# Usage

To implement a new platform-specific implementation of `open_system_folder`, extend
[`OpenSystemFolderPlatform`][2] with an implementation that performs the
platform-specific behavior.

[1]: https://pub.dev/packages/open_system_folder
[2]: lib/src/open_system_folder_platform.dart
