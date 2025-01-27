import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/add_treatment_bloc.dart';
import '../model/duration_extension.dart';
import 'choose_treatment_type.dart';
import 'duration_picker.dart';

class AddTreatmentForm extends StatefulWidget {
  const AddTreatmentForm({super.key});

  @override
  State<AddTreatmentForm> createState() => _AddTreatmentFormState();
}

class _AddTreatmentFormState extends State<AddTreatmentForm> {
  final _addTreatmentKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _addTreatmentKey,
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //* Medicine Name
            TextFormField(
              decoration: _decoration(
                label: "Your Medicine",
              ),
              onChanged: (value) =>
                  context.read<AddTreatmentBloc>().add(FormNameChanged(value)),
            ),
            //* Medicine Type
            ChooseTreatmentType(),
            //* Medicine Duration
            TextFormField(
              controller: TextEditingController(
                text: context
                    .read<AddTreatmentBloc>()
                    .state
                    .duration
                    ?.toTreatmentDuration,
              ),
              decoration: _decoration(
                label: "Duration",
              ),
              readOnly: true,
              validator: _validator,
              onTap: () {
                FocusScope.of(context).unfocus(); // Close the keyboard
                showDialog(
                  context: context,
                  builder: (_) => BlocProvider.value(
                    value: context.read<AddTreatmentBloc>(),
                    child: DurationPicker(),
                  ),
                );
              },
            ),
            //* Submit Button
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Add Treatment'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _decoration({String? label}) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
    );
  }

  String? _validator(String? txt) {
    return null;
  }
}
