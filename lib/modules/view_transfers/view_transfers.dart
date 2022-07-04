import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/modules/add_customer/add_customer.dart';
import 'package:todoapp/shared/components/constants.dart';
import 'package:todoapp/shared/cubit/states.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';


class ViewTransferScreen extends StatelessWidget {
 List<Map> transfer=[
  {
   "bank_id":"2803923",
   "money":"100"
 },
   {
     "bank_id":"2803923",
     "money":"100"
   },
   {
     "bank_id":"2803923",
     "money":"100"
   },
 ];
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text('Transfers',style: TextStyle(color: primaryColor,fontSize: 20.sp),),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: TansferBuilder(transfers: cubit.Transfer));

      },
    );
  }
}
