import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/add_treatment_bloc.dart';
import 'add_treatment_form.dart';

class AddTreatmentPage extends StatelessWidget {
  const AddTreatmentPage({super.key});

  static get route =>
      MaterialPageRoute(builder: (context) => AddTreatmentPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTreatmentBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Treatment'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
              AddTreatmentForm(),
            ],
          ),
        ),
      ),
    );
  }
}
