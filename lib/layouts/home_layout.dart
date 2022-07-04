import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/shared/cubit/cubit.dart';
import 'package:todoapp/shared/cubit/states.dart';
import '../shared/components/components.dart';
import 'package:sizer/sizer.dart';

import '../shared/components/constants.dart';


/*
State<HomeLayout> createState() => _HomeLayoutState();
*/

class HomeLayout extends StatelessWidget {
  @override

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if(state is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit =AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: const Text(
                'Customer App',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                      children: [
                        Image.asset('assets/images/homeImage.png',width: 100.w),
                      ],
                    ),),
                    Expanded(
                      flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        defaultButton(buttonWidth: 85.w,buttonHeight: 8.h, background: primaryColor!, function: (){}, text: 'View Customers',isUpperCase: true,radius: 50,FontSize: 20.sp,),
                        defaultButton(buttonWidth: 85.w,buttonHeight: 8.h, background: primaryColor!, function: (){}, text: 'View Transfers',isUpperCase: true,radius: 50,FontSize: 20.sp,)
                      ],
                    ))
                  ],
                ),
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }

  //Create database and table


// method to insert to data base


}
