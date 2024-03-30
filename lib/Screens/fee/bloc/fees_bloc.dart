import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/fee.dart';
import '../../Attendance/classSingleton.dart';
import '../api_Service.dart';

part 'fees_event.dart';
part 'fees_state.dart';

class FeesBloc extends Bloc<FeesEvent, FeesState> {
  final FeesService feesService;
  FeesBloc(this.feesService) : super(FeesInitial()) {
    on<FetchFees>(_fetchFees);
  }
  void _fetchFees(FetchFees Event,Emitter<FeesState> emit)async{
    if(Event is FetchFees){
      emit(FeesLoading());
      try{
        final fee = await FeesService.getFees();
        final classFees = fee.where((fees) => fees.className == ClassNameManager().className).toList();
        print(classFees);
        emit(FeesLoaded(fees: classFees));

      }catch (_) {
        emit(FeesError(message: "not fetched"));
      }
    }

  }
}
