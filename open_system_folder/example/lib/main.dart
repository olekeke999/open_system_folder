import 'package:flutter/material.dart';
import 'package:open_system_folder/open_system_folder.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SystemFolder> get _testFolders => [
        SystemFolder.documents,
        SystemFolder.downloads,
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OpenSystemFolder Example')),
      body: Center(
        child: ListView.separated(
          itemCount: _testFolders.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = _testFolders[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                onPressed: () async => _openFolder(context, item),
                child: Text('Open ${item.name}'),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
        ),
      ),
    );
  }

  Future<void> _openFolder(
    BuildContext context,
    SystemFolder folder,
  ) async {
    if (!context.mounted) return;
    try {
      await openSystemFolder(
        systemFolder: folder,
        // Android: in the Download or Documents
        // iOS: in the your App folder
        // create folder 'Some' and then inside 'some' create folder 'One'.
        // Then uncomment next line:
        // subPath: 'Some/One',
      );
    } catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).primaryColor,
          content: Text('$error'),
        ),
      );
    }
  }
}
