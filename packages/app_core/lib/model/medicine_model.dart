import 'medicine_type_enum.dart';

class Medicine {
  final int medicineId;
  final String name;
  final MedicineType type;
  Medicine({
    required this.medicineId,
    required this.name,
    required this.type,
  });
}
