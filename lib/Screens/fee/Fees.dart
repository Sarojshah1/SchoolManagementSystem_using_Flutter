import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schoolmanagementsystem/Screens/fee/Payments.dart';
import 'package:schoolmanagementsystem/Screens/fee/api_Service.dart';
import 'package:schoolmanagementsystem/Utils/Image_Constant.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bloc/fees_bloc.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({Key? key}) : super(key: key);

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  late FeesBloc _feesBloc;
  late FeesService _feesService;
  @override
  void initState() {
    super.initState();
    _feesService=FeesService();
    _feesBloc = FeesBloc(_feesService); // Initialize FeesBloc
    _feesBloc.add(FetchFees()); // Fetch fees for a specific class
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.blue700,
        leading: Image.asset(Fee),
        title: Text("YOUR FEES",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24.w,color: Colors.white),),


      ),
      body:Padding(
        padding: EdgeInsets.all(16.0),
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
            SizedBox(height: 20),
            Expanded(
              child:  BlocBuilder<FeesBloc,FeesState>(
                bloc: _feesBloc,
                  builder: (context, state){
                  if(state is FeesLoaded){
                    return ListView.builder(
                      itemCount: state.fees.length,
                      itemBuilder: (context, index) {
                        final fees=state.fees[index];
                        return FeeItemWidget(
                          title: fees.feeType ?? '',
                          description: fees.description ?? '',
                          amount: fees.amount ?? 0.00,
                        );
                      },
                    );
                  }else if(state is FeesError){
                    return Text('Failed to load Fee Details.');
                  }else {
                    return Center(child: CircularProgressIndicator());
                  }
                  }

              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const PaymentScreen();
                }));
              },
              child: Text(
                'Your Payments',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).cardColor,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class FeeItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final double amount;

  const FeeItemWidget({
    required this.title,
    required this.description,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.money, color: Theme.of(context).cardColor),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            'Npr.$amount',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

