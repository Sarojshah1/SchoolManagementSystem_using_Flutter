import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../models/Assignment_model.dart';
import '../../../Attendance/classSingleton.dart';
import '../api_Services.dart';
part 'assignmant_event.dart';
part 'assignmant_state.dart';

class AssignmantBloc extends Bloc<AssignmantEvent, AssignmantState> {
  final AssignmentRepository assignmentRepository;

  AssignmantBloc(this.assignmentRepository) : super(AssignmentLoading()) {
    on<FetchAssignments>(_fetchAssignments);
  }

  void _fetchAssignments(FetchAssignments event, Emitter<AssignmantState> emit) async {
    emit(AssignmentLoading());
    try {
      final assignments = await assignmentRepository.fetchAssignments();
      final classAssignment = assignments.where((assignment) => assignment.className == ClassNameManager().className).toList();
      print(assignments);
      emit(AssignmentLoadSuccess(classAssignment));
    } catch (_) {
      emit(AssignmentLoadFailure());
    }
  }
}
