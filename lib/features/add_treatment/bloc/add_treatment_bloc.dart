import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../treatment/models/models.dart';

part 'add_treatment_event.dart';
part 'add_treatment_state.dart';

class AddTreatmentBloc extends Bloc<AddTreatmentEvent, AddTreatmentState> {
  AddTreatmentBloc() : super(AddTreatmentState()) {
    on<FormNameChanged>(_onFormNameChanged);
    on<FormTypeChanged>(_onFormTypeChanged);
    on<FormDurationChanged>(_onFormDurationChanged);
  }

  void _onFormNameChanged(
      FormNameChanged event, Emitter<AddTreatmentState> emit) {
    emit(state.copyWith(
      name: event.name,
    ));
  }

  void _onFormTypeChanged(
      FormTypeChanged event, Emitter<AddTreatmentState> emit) {
    emit(
      state.copyWith(type: event.type),
    );
  }

  void _onFormDurationChanged(
      FormDurationChanged event, Emitter<AddTreatmentState> emit) {
    emit(
      state.copyWith(duration: event.duration),
    );
  }

  @override
  void onChange(Change<AddTreatmentState> change) {
    super.onChange(change);
    log(change.nextState.props.toString(), name: "AddTreatmentBloc");
  }
}
