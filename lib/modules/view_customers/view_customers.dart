import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/shared/components/constants.dart';

import '../../shared/components/components.dart';



class CustomersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
             defaultButton(buttonWidth: 35.w, buttonHeight: 6.h, background: primaryColor!, function: (){}, text: '+ Add',isUpperCase: true,radius: 10,FontSize: 16.sp
               ,),
             SizedBox(
               width: 1.w,
             ),
           ],
         ),
         ),
       ],
     ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomerCard(
            money: 1230,
            function: (){
              print("Work");
            },
          )
        ],
      ),
    ),
    );
  }
}
