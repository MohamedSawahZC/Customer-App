import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/modules/add_customer/add_customer.dart';
import 'package:todoapp/shared/components/constants.dart';
import 'package:todoapp/shared/cubit/states.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';


class CustomersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              Center(
                child: defaultButton(
                  buttonWidth: 95.w,
                  buttonHeight: 6.h,
                  background: primaryColor!,
                  function: () {
                    navigateTo(context, AddCustomer());
                  },
                  text: '+ Add Customer',
                  isUpperCase: true,
                  radius: 10,
                  FontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: 1.w,
              ),
            ],
          ),
          body: customersBuilder(customers: AppCubit.get(context).Customers),
        );
      },
    );
  }
}
