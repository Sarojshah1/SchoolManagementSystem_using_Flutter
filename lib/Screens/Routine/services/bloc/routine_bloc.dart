import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/routine_model.dart';
import '../../../Attendance/classSingleton.dart';
import '../api_service.dart';

part 'routine_event.dart';
part 'routine_state.dart';

class RoutineBloc extends Bloc<RoutineEvent, RoutineState> {
  final RoutineRepository repository;
  RoutineBloc({required this.repository}) : super(RoutineInitial()){
    on<FetchRoutine>(_fetchroutine);
  }
  void _fetchroutine(FetchRoutine Event,Emitter<RoutineState> emit)async{
      emit(RoutineLoading());
      try {
        final routines = await repository.getRoutine();
        final classRoutines = routines.where((routine) => routine.className == ClassNameManager().className).toList();
        print(routines);
        emit( RoutineLoaded(classRoutines));
      } catch (e) {
        emit(RoutineError('Failed to fetch routines'));
      }

  }


}
