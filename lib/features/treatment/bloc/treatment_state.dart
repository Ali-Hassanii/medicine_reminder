part of 'treatment_bloc.dart';

sealed class TreatmentState extends Equatable {
  const TreatmentState();
  
  @override
  List<Object> get props => [];
}

final class TreatmentInitial extends TreatmentState {}
