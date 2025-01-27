import 'medicine_model.dart';

class Treatment {
  final int? treatmentId;
  final Medicine medicine;
  final DateTime start;
  final Duration frequency;
  final DateTime lastTaken;
  final int? dosage;
  final DateTime? end;
  Treatment({
    this.treatmentId,
    required this.medicine,
    required this.start,
    required this.frequency,
    required this.lastTaken,
    this.dosage,
    this.end,
  });
}
