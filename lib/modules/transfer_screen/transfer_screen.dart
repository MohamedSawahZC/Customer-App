import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/modules/money_transfer/money_transfer.dart';
import 'package:todoapp/shared/components/components.dart';
import 'package:todoapp/shared/components/constants.dart';
import 'package:todoapp/shared/cubit/cubit.dart';
import 'package:todoapp/shared/cubit/states.dart';

class TransferScreen extends StatelessWidget {
  Map? model;
  TransferScreen({
    required this.model,
});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.asset(
                      'assets/images/profile.png',
                      width: 30.w,
                    )),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Name',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    ModTextFormField(
                      enabled: false,
                      width: 80.w,
                      hintText: '${model!['name']}',
                      height: 6.h,
                      borderRadius: 5,
                      filledColor: primaryColor,
                      hintFontSize: 14.sp,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'Bank ID',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    ModTextFormField(
                      enabled: false,
                      width: 80.w,
                      height: 6.h,
                      hintText: '${model!['bank_id']}',
                      borderRadius: 5,
                      filledColor: primaryColor,
                      hintFontSize: 14.sp,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'Money',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    ModTextFormField(
                      enabled: false,
                      width: 80.w,
                      height: 6.h,
                      hintText: '${model!['money']}\$',
                      borderRadius: 5,
                      filledColor: primaryColor,
                      hintFontSize: 14.sp,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    defaultButton(
                      buttonWidth: 80.w,
                      buttonHeight: 6.h,
                      FontSize: 16.sp,
                      background: secondaryColor!,
                      function: () {
                        navigateTo(context, MoneyTransfer(model: model));
                      },
                      text: 'Transfer Money',
                      isUpperCase: true,
                      radius: 5,
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
