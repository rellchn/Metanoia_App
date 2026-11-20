import 'package:material_ui/material_ui.dart';

import 'screen/welcome_screen.dart';

void main() {
  runApp(const MetanoiaApp());
}

class MetanoiaApp extends StatelessWidget {
  const MetanoiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metanoia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter', // opsional, tambahkan di pubspec.yaml
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5B8E8B)),
      ),
      home: const WelcomeScreen(),
    );
  }
}
