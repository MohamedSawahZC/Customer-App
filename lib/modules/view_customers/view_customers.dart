import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/shared/components/constants.dart';
import 'package:todoapp/shared/cubit/states.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';

List<Map> cutsomers = [
  {'name': 'Mohamed Sawah', 'bank_id': "16513213213", 'money': "1230"},
  {'name': 'Mohamed Sawah', 'bank_id': "16513213213", 'money': "1230"},
  {'name': 'Mohamed Sawah', 'bank_id': "16513213213", 'money': "1230"},
  {'name': 'Mohamed Sawah', 'bank_id': "16513213213", 'money': "1230"},
  {'name': 'Mohamed Sawah', 'bank_id': "16513213213", 'money': "1230"},

];

class CustomersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              Padding(
                padding: EdgeInsets.all(2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ModTextFormField2(
                      lineHeight: 1,
                      width: 60.w,
                      hintText: 'Search...',
                      filledColor: Colors.blueGrey[100],
                      borderColor: Colors.transparent,
                      prefixWidget: Icon(
                        Icons.search,
                        color: Colors.grey[200],
                      ),
                      labelFontSize: 16.sp,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    defaultButton(
                      buttonWidth: 35.w,
                      buttonHeight: 6.h,
                      background: primaryColor!,
                      function: () {},
                      text: '+ Add',
                      isUpperCase: true,
                      radius: 10,
                      FontSize: 16.sp,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: customersBuilder(customers: cutsomers),
        );
      },
    );
  }
}
