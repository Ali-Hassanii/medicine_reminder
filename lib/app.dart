import 'package:flutter/material.dart';
import 'features/treatment/view/treatment_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: TreatmentListPage(),
    );
  }

  ThemeData get appTheme => ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          dynamicSchemeVariant: DynamicSchemeVariant.vibrant,
          contrastLevel: 1,
          seedColor: Colors.teal,
        ),
      );
}
