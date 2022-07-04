import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/modules/view_customers/view_customers.dart';
import 'package:todoapp/shared/components/bloc_observer.dart';
import 'package:todoapp/shared/cubit/cubit.dart';
import 'package:sizer/sizer.dart';
import 'layouts/home_layout.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  BlocOverrides.runZoned(
        () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  runApp(
    DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools
      ],
        builder:(context)=> MyApp()
    ),
  );
}

class MyApp extends StatelessWidget
{
  // constructor
  // build

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:(context)=>AppCubit(),
        ),
      ],
      child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Jannah',
              ),
              home: CustomersScreen(),
            );
          }
      )
    );
  }
}