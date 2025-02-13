import 'package:app_core/model.dart';
import 'package:flutter/material.dart';
import 'package:svg_icon/svg_icon.dart';


class MedicineCard extends StatelessWidget {
  final Medicine medicine;

  const MedicineCard({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SvgIcon(icon: medicine.type.name),
        title: Text(medicine.name),
        // TODO User note about treatment. exm: 'Take after meal', 'For headache' etc.
        subtitle: Text('Treatment Description'),
      ),
    );
  }
}
