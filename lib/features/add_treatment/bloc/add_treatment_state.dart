part of 'add_treatment_bloc.dart';

final class AddTreatmentState extends Equatable {
  final String? name;
  final MedicineType? type;
  final Duration? duration;

  const AddTreatmentState({
    this.name,
    this.type,
    this.duration,
  });

  @override
  List<Object?> get props => [name, type, duration];

  AddTreatmentState copyWith({
    String? name,
    MedicineType? type,
    Duration? duration,
  }) {
    return AddTreatmentState(
      name: name ?? this.name,
      type: type ?? this.type,
      duration: duration ?? this.duration,
    );
  }
}
