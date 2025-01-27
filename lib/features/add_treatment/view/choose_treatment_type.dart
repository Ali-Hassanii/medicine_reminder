import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:svg_icon/svg_icon.dart';
import '../../treatment/models/models.dart';
import '../bloc/add_treatment_bloc.dart';

class ChooseTreatmentType extends StatelessWidget {
  const ChooseTreatmentType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTreatmentBloc, AddTreatmentState>(
      builder: (context, state) {
        return Wrap(
          spacing: 8,
          children: MedicineType.values
              .map(
                (type) => ChoiceChip(
                  avatar: SvgIcon(icon: type.name),
                  label: Text(type.name),
                  labelPadding: EdgeInsets.all(0),
                  // padding: EdgeInsets.all(0),
                  selected: type ==
                      context.select(
                        (AddTreatmentBloc bloc) => bloc.state.type,
                      ),
                  onSelected: (selected) {
                    context
                        .read<AddTreatmentBloc>()
                        .add(FormTypeChanged(selected ? type : null));
                    // _choice = selected ? type : null;
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }
}
