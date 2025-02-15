part of 'new_treatment_form_bloc.dart';

sealed class NewTreatmentFormEvent extends Equatable {
  const NewTreatmentFormEvent();

  @override
  List<Object> get props => [];
}

final class TreatmentFormMedicineChanged extends NewTreatmentFormEvent {
  final Medicine medicine;

  const TreatmentFormMedicineChanged(this.medicine);

  @override
  List<Object> get props => [medicine];
}

final class TreatmentFormIntervalChanged extends NewTreatmentFormEvent {
  final Duration interval;
  const TreatmentFormIntervalChanged(this.interval);

  @override
  List<Object> get props => [interval];
}

final class TreatmentFormLastIntakeChanged extends NewTreatmentFormEvent {
  final DateTime lastIntake;
  const TreatmentFormLastIntakeChanged(this.lastIntake);

  @override
  List<Object> get props => [lastIntake];
}
