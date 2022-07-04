
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/modules/add_customer/add_customer.dart';
import 'package:todoapp/modules/view_customers/view_customers.dart';
import 'package:todoapp/shared/components/bloc_observer.dart';
import 'package:todoapp/shared/cubit/cubit.dart';
import 'package:sizer/sizer.dart';
import 'layouts/home_layout.dart';
import 'package:device_preview/device_preview.dart';

import 'modules/transfer_screen/transfer_screen.dart';
import 'modules/view_transfers/view_transfers.dart';

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
        BlocProvider(create: (BuildContext context)=> AppCubit()..createDatabase(), lazy: false,)
    ],
      child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Jannah',
              ),
              home: HomeLayout(),
            );
          }
      )
    );
  }
}