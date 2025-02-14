import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/add_treatment_bloc.dart';

import 'action_button.dart';
import 'additional_dropdown.dart';
import 'duration_picker.dart';
import 'wave_effect.dart';
import 'medicine_scanner.dart';

class AddTreatmentPage extends StatelessWidget {
  const AddTreatmentPage({super.key});

  static get route => MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
          create: (context) => AddTreatmentBloc(),
          child: const AddTreatmentPage(),
        ),
      );

  final double _spacing = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Treatment'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.04),
        //* Scroll
        child: SingleChildScrollView(
          //* Column
          child: BlocBuilder<AddTreatmentBloc, AddTreatmentState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: _spacing,
                //* Body
                children: [
                  // Medicine
                  ActionButton(
                    icon: Icons.medication,
                    label: "Add medicine",
                    onPressed: () => _openMedicineScanner(context),
                  ),

                  // Frequency Duration
                  ActionButton(
                    icon: Icons.timer,
                    label: "Intake interval",
                    onPressed: () => _chooseIntakeInterval(context),
                    controller: TextEditingController(
                      text: context
                          .read<AddTreatmentBloc>()
                          .state
                          .duration
                          ?.toTreatmentDuration,
                    ),
                  ),

                  // Last medicine intake
                  ActionButton(
                    icon: Icons.history,
                    label: "Last intake",
                    onPressed: () => _chooseLastMedicineIntake(context),
                  ),

                  // More Info
                  AdditionalDropdown(
                    spacing: _spacing,
                    children: [
                      // Dosage number
                      ActionButton(
                        icon: Icons.numbers,
                        label: "Dosage",
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
      // Bottom graphics
      bottomNavigationBar: WaveEffect(),
    );
  }

  void _openMedicineScanner(BuildContext context) {
    Navigator.push(context, MedicineScanner.route);
  }

  void _chooseIntakeInterval(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<AddTreatmentBloc>(),
        child: DurationPicker(),
      ),
    );
  }

  void _chooseLastMedicineIntake(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        Duration(days: 30),
      ),
      lastDate: DateTime.now(),
    );
  }
}
