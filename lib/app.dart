import 'package:flutter/material.dart';
import 'features/treatment/view/treatment_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Medicine Reminder",
      theme: _appTheme,
      home: const TreatmentListPage(),
    );
  }

  // ! App Theme
  ThemeData get _appTheme {
    return ThemeData.from(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
      ),
    );
  }
}
