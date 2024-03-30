part of 'payments_bloc.dart';

sealed class PaymentsState extends Equatable {
  const PaymentsState();
  
  @override
  List<Object> get props => [];
}

class PaymentsInitial extends PaymentsState {}
class PaymentsLoading extends PaymentsState {}
class PaymentsLoaded extends PaymentsState {
  final List<PaymentModel> payments;
  const PaymentsLoaded({required this.payments});
  @override
  List<Object> get props => [payments];
}
class PaymentsError extends PaymentsState {
  final String message;
  const PaymentsError({required this.message});

  @override
  List<Object> get props => [message];
}

