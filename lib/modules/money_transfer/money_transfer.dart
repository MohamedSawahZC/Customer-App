import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/layouts/home_layout.dart';
import 'package:todoapp/modules/money_transfer/money_transfer.dart';
import 'package:todoapp/shared/components/components.dart';
import 'package:todoapp/shared/components/constants.dart';
import 'package:todoapp/shared/cubit/cubit.dart';
import 'package:todoapp/shared/cubit/states.dart';

import '../view_customers/view_customers.dart';

class MoneyTransfer extends StatelessWidget {
  Map? model;
  MoneyTransfer({
    required this.model,
  });
  var formKey = GlobalKey<FormState>();
  var moneyController = TextEditingController();
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
              centerTitle: true,
              title: const Text(
                'Transfer Money',
                style:
                TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Money',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    ),
                    ModTextFormField(
                      textFieldController: moneyController,
                      validateTextField: (String? val) {
                        if (val!.isEmpty) {
                          return 'Please enter money';
                        }
                      },
                      enabled: true,
                      hintText: 'Enter money please',
                      width: 90.w,
                      hintFontSize: 14.sp,
                      borderRadius: 10,
                      borderColor: Colors.transparent,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    defaultButton(
                      buttonWidth: 90.w,
                      buttonHeight: 6.h,
                      FontSize: 20.sp,
                      background: primaryColor!,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          var currentMoney=int.parse(model!['money']);
                          var newMoney=int.parse(moneyController.text);
                          var lastMoney=currentMoney+newMoney;
                          var id=model!['id'];
                          cubit.updateData(id:id ,money:'${lastMoney}' );
                          cubit.insertToTransfers(bank_id: model!['bank_id'], money: moneyController.text);
                        }
                        if(state is !AppInsertToTransferDatabaseState){
                          navigateTo(context, HomeLayout());
                        }
                      },
                      text: 'Transfer',
                      isUpperCase: true,
                      radius: 10,
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
