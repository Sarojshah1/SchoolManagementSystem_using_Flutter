import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/resultModel.dart';
import '../../../fee/PaymentServices/useridsingleton.dart';
import '../resultrepo.dart';

part 'result_event.dart';
part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final ResultRepository repository;
  ResultBloc({required this.repository}) : super(ResultInitial()) {
    on<FetchResultData>(_fetchresult);
  }
  void _fetchresult(FetchResultData Event,Emitter<ResultState> emit)async{
    if(Event is FetchResultData){
      emit(ResultLoadingState());
      try{
        final results=await ResultRepository().fetchResults();
        final studentId = StudentIdManager().studentId;
        final Studentresult = results.where((Result) => Result.studentId?.id == studentId).toList();
        print("hello $Studentresult");
        emit(ResultLoadedState(results: Studentresult));
        
      }catch (error) {
        emit(ResultErrorState(error: error.toString()));
        print(error);
      }
    }
    
  }
}
