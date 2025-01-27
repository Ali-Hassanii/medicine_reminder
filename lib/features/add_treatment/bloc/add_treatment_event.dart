part of 'add_treatment_bloc.dart';

sealed class AddTreatmentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


// * Add Treatment Form Events
final class FormNameChanged extends AddTreatmentEvent {
  final String? name;

  FormNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

final class FormTypeChanged extends AddTreatmentEvent {
  final MedicineType? type;

  FormTypeChanged(this.type);

  @override
  List<Object?> get props => [type];
}

final class FormDurationChanged extends AddTreatmentEvent {
  final Duration? duration;

  FormDurationChanged(this.duration);

  @override
  List<Object?> get props => [duration];
}
