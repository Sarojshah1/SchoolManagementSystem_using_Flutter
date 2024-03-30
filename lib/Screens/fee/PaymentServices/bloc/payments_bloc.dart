import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/PaymentModel.dart';
import '../paymentrepo.dart';
import '../useridsingleton.dart';

part 'payments_event.dart';
part 'payments_state.dart';

class PaymentsBloc extends Bloc<PaymentsEvent, PaymentsState> {
  final PaymentRepository paymentRepository;
  PaymentsBloc(this.paymentRepository) : super(PaymentsInitial()) {
    on<FetchPayments>(_fetchpayments);
  }
  void _fetchpayments(FetchPayments Event,Emitter<PaymentsState> emit)async{
    print(StudentIdManager().studentId);
    if(Event is FetchPayments){
      emit(PaymentsLoading());
      try{
        final Payments = await PaymentRepository().fetchPayments();
        final studentId = StudentIdManager().studentId;
        final Studentpayments = Payments.where((Payment) => Payment.studentId?.id == studentId).toList();
        print("hello $Studentpayments");
        emit(PaymentsLoaded(payments: Studentpayments));


      }catch (_) {
        emit(PaymentsError(message: "Data not loaded"));
      }
    }

  }
}
