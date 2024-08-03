enum SystemFolder {
  documents,
  downloads;

  /// system folder name
  String get folderName => switch (this) {
        SystemFolder.documents => 'Documents',
        SystemFolder.downloads => 'Download',
      };
}
