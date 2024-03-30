part of 'payments_bloc.dart';

sealed class PaymentsEvent extends Equatable {
  const PaymentsEvent();

  @override
  List<Object> get props => [];
}
class FetchPayments extends PaymentsEvent {
}
