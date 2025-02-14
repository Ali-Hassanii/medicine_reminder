import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'treatment_event.dart';
part 'treatment_state.dart';

class TreatmentBloc extends Bloc<TreatmentEvent, TreatmentState> {
  TreatmentBloc() : super(TreatmentInitial()) {
    on<TreatmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
