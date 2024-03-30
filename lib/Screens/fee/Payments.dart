import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schoolmanagementsystem/Screens/fee/PaymentServices/bloc/payments_bloc.dart';
import 'package:schoolmanagementsystem/Screens/fee/PaymentServices/paymentrepo.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utils/Image_Constant.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late PaymentRepository _paymentRepository;
  late PaymentsBloc _paymentsBloc;
  @override
  void initState() {
    super.initState();
    _paymentRepository=PaymentRepository();
    _paymentsBloc = PaymentsBloc(_paymentRepository); // Initialize FeesBloc
    _paymentsBloc.add(FetchPayments()); // Fetch fees for a specific class
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.blue700,
        leading: Image.asset(Fee),
        title: Text("YOUR PAYMENTS",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24.w,color: Colors.white),),

      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Fees Details',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child:  BlocBuilder<PaymentsBloc,PaymentsState>(
                  bloc: _paymentsBloc,
                  builder: (context, state){
                    if(state is PaymentsLoaded){
                      return ListView.builder(
                        itemCount: state.payments.length,
                        itemBuilder: (context, index) {
                          final payment = state.payments[index];
                          return Card(
                            elevation: 3,
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5.h),
                                  Text('Total Amount: Npr.${payment.totalAmount}'),
                                  SizedBox(height: 5.h),
                                  Text('Paid Amount: Npr.${payment.paidAmount}'),
                                  SizedBox(height: 5.h),
                                  Text('Due Amount: Npr.${payment.dueAmount}'),
                                  SizedBox(height: 5.h),
                                  // Text('Is Paid: ${payment.isPaid ? 'Yes' : 'No'}'),
                                  // SizedBox(height: 10),
                                const  Text(
                                    'Installments:',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5.h),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: payment.installments!.length,
                                    itemBuilder: (context, index) {
                                      final installment = payment.installments![index];
                                      return ListTile(
                                        title: Text('Installment ${installment.installmentNumber}:'),
                                        subtitle: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Amount Paid: Npr.${installment.amountPaid}'),
                                            Text('Payment Date: ${installment.paymentDate}'),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }else if(state is PaymentsError){
                      return const Text('Failed to load Fee Details.');
                    }else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }

              ),
            ),
            SizedBox(height: 20.h),

          ],
        ),
      )
    );
  }
}
