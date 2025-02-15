import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:app_core/model.dart';

part 'new_treatment_form_event.dart';
part 'new_treatment_form_state.dart';

class NewTreatmentFormBloc
    extends Bloc<NewTreatmentFormEvent, NewTreatmentFormState> {
  NewTreatmentFormBloc() : super(NewTreatmentFormState()) {
    on<TreatmentFormMedicineChanged>(_onMedicineChanged);
    on<TreatmentFormIntervalChanged>(_onIntervalChanged);
    on<TreatmentFormLastIntakeChanged>(_onLastIntakeChanged);
  }

  void _onMedicineChanged(
    TreatmentFormMedicineChanged event,
    Emitter<NewTreatmentFormState> emit,
  ) {
    emit(state.copyWith(medicine: event.medicine));
  }

  void _onIntervalChanged(
    TreatmentFormIntervalChanged event,
    Emitter<NewTreatmentFormState> emit,
  ) {
    emit(state.copyWith(interval: event.interval));
  }

  void _onLastIntakeChanged(
    TreatmentFormLastIntakeChanged event,
    Emitter<NewTreatmentFormState> emit,
  ) {
    emit(state.copyWith(lastIntake: event.lastIntake));
  }

  @override
  void onChange(Change<NewTreatmentFormState> change) {
    super.onChange(change);
    log(change.nextState.toString(), name: 'NewTreatmentFormBloc');
  }
}
