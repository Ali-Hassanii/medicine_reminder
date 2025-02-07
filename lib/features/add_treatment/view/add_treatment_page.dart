import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/features/add_treatment/view/wave_effect.dart';

import '../bloc/add_treatment_bloc.dart';
import '../model/duration_extension.dart';

import 'action_button.dart';
import 'additional_dropdown.dart';
import 'duration_picker.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 16),
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
                    label: "Medicine Name",
                    onPressed: () {
                      // TODO: [New Feature] Medicine Scanner
                    },
                  ),

                  // Frequency Duration
                  ActionButton(
                    label: "Duration",
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => BlocProvider.value(
                        value: context.read<AddTreatmentBloc>(),
                        child: DurationPicker(),
                      ),
                    ),
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
                    label: "Last medicine intake",
                    onPressed: () => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(
                        Duration(days: 30),
                      ),
                      lastDate: DateTime.now(),
                    ),
                  ),

                  // More Info
                  AdditionalDropdown(
                    spacing: _spacing,
                    children: [
                      // Dosage number
                      ActionButton(
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
}
