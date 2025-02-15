part of 'new_treatment_form_bloc.dart';

final class NewTreatmentFormState extends Equatable {
  const NewTreatmentFormState({
    this.medicine,
    this.interval = Duration.zero,
    this.lastIntake,
    this.dosage = 0,
  });

  final Medicine? medicine;
  final Duration interval;
  final DateTime? lastIntake;
  final int dosage;

  NewTreatmentFormState copyWith({
    Medicine? medicine,
    Duration? interval,
    DateTime? lastIntake,
    int? dosage,
  }) {
    return NewTreatmentFormState(
      medicine: medicine ?? this.medicine,
      interval: interval ?? this.interval,
      lastIntake: lastIntake ?? this.lastIntake,
      dosage: dosage ?? this.dosage,
    );
  }

  @override
  List<Object?> get props => [medicine, interval, lastIntake, dosage];
}
