import 'package:flutter/material.dart';
import 'features/treatment/view/treatment_list_page.dart';
import 'features/add_treatment/add_treatment.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Medicine Reminder",
      theme: _appTheme,
      routes: _routes,
      initialRoute: "treatmentListPage",
    );
  }

  // ! App Theme
  ThemeData get _appTheme {
    return ThemeData.from(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        dynamicSchemeVariant: DynamicSchemeVariant.vibrant,
        contrastLevel: 1,
        seedColor: Colors.teal,
      ),
    );
  }

  // ! Add Routes Here
  Map<String, WidgetBuilder> get _routes {
    return {
      "treatmentListPage": (context) => TreatmentListPage(),
      "addTreatmentPage": (context) => AddTreatmentPage(),
    };
  }
}
