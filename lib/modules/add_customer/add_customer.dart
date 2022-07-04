import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/layouts/home_layout.dart';
import 'package:todoapp/shared/components/components.dart';
import 'package:todoapp/shared/components/constants.dart';
import 'package:todoapp/shared/cubit/cubit.dart';

import '../../shared/cubit/states.dart';
import '../view_customers/view_customers.dart';

class AddCustomer extends StatefulWidget {
  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  @override
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var bankIdController = TextEditingController();
  var moneyController = TextEditingController();
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
                'Add Customer',
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
                      'Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    ),
                    ModTextFormField(
                      textFieldController: nameController,
                      validateTextField: (String? val) {
                        if (val!.isEmpty) {
                          return 'Please enter name';
                        }
                      },
                      enabled: true,
                      hintText: 'Enter name please',
                      width: 90.w,
                      hintFontSize: 14.sp,
                      borderRadius: 10,
                      borderColor: Colors.transparent,
                    ),
                    Text(
                      'Bank ID',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    ),
                    ModTextFormField(
                      textFieldController: bankIdController,
                      validateTextField: (String? val) {
                        if (val!.isEmpty) {
                          return 'Please enter bank id';
                        }
                      },
                      enabled: true,
                      hintText: 'Enter bank id please',
                      width: 90.w,
                      hintFontSize: 14.sp,
                      borderRadius: 10,
                      borderColor: Colors.transparent,
                    ),
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
                          cubit.insertToDatabase(name: nameController.text, bank_id: bankIdController.text, money: moneyController.text);
                        }
                        if(state is !AppInsertDatabaseState){
                          navigateTo(context, CustomersScreen());
                        }
                      },
                      text: 'Add',
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
