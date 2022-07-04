import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/shared/components/constants.dart';
import 'package:todoapp/shared/cubit/cubit.dart';
import 'package:sizer/sizer.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String value)? onSubmit,
  Function(String value)? onChange,
  Function()? onTap,
  bool isPassword = false,
  required String? Function(String? value)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onSubmit,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

//Build Task item here

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text(
                "${model['time']}",
                style: TextStyle(fontSize: 13),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${model['title']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "${model['date']}",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateData(status: 'done', id: model['id']);
              },
              icon: Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateData(status: 'archive', id: model['id']);
              },
              icon: Icon(
                Icons.archive,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );

Widget tasksBuilder({
  required List<Map> tasks,
}) =>
    ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
        ),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              'No Tasks Yet, Please Add Some Tasks',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

class defaultButton extends StatelessWidget {
  defaultButton({
    required this.buttonWidth,
    required this.buttonHeight,
    required this.FontSize,
    required this.background,
    required this.function,
    required this.text,
    this.radius,
    bool? isUpperCase,
  });

  double buttonWidth = double.infinity;
  double buttonHeight = double.infinity;
  double FontSize = 10;
  Color background = Colors.blue;
  bool isUpperCase = true;
  double? radius = 3.0;
  VoidCallback function;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: FontSize,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius!,
        ),
        color: background,
      ),
    );
  }
}

class ModTextFormField extends StatelessWidget {
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Color borderColor;
  final TextEditingController? textFieldController;
  final String? hintText;
  final Function? suffixTap;
  final Function? validateTextField;
  final Function? onSubmit;
  final Color? filledColor;
  final Color? inputColor;
  final bool isSecure;
  final int lineHeight;
  final double? borderRadius;
  final double hintFontSize;
  final double? width;
  final double? height;

  const ModTextFormField({
    Key? key,
    this.hintText,
    this.inputColor,
    this.width,
    this.height,
    this.borderRadius,
    this.prefixWidget,
    this.suffixWidget,
    this.borderColor = Colors.blue,
    this.textFieldController,
    this.suffixTap,
    this.onSubmit,
    this.validateTextField,
    this.filledColor = Colors.lightBlue,
    this.isSecure = false,
    this.lineHeight = 1,
    this.hintFontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        enabled: false,
        onFieldSubmitted: (String? value) {
          return onSubmit!(value);
        },
        textAlign: TextAlign.center,
        //textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: inputColor,
        ),
        controller: textFieldController,
        obscureText: isSecure,
        maxLines: lineHeight,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          errorStyle: const TextStyle(
            fontSize: 16,
          ),
          filled: true,
          fillColor: filledColor,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: hintFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          prefixIcon: prefixWidget,
          suffixIcon: suffixWidget,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(
              color: borderColor,
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(
              width: 0.5,
              style: BorderStyle.solid,
              color: borderColor,
            ),
          ),
        ),
        validator: (String? value) {
          return validateTextField!(value);
        },
      ),
    );
  }
}

class ModTextFormField2 extends StatelessWidget {
  final String hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Color borderColor;
  final TextEditingController? textFieldController;
  final Function? suffixTap;
  final Function? validateTextField;
  final Function? onSubmit;
  final Color? filledColor;
  final bool isSecure;
  final int lineHeight;
  final double labelFontSize;
  final double hintFontSize;
  final double? width;

  const ModTextFormField2({
    Key? key,
    required this.hintText,
    this.prefixWidget,
    this.suffixWidget,
    this.borderColor = Colors.blue,
    this.textFieldController,
    this.suffixTap,
    this.onSubmit,
    this.validateTextField,
    this.filledColor = Colors.lightBlue,
    this.isSecure = false,
    this.lineHeight = 1,
    this.labelFontSize = 16,
    this.width,
    this.hintFontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        onFieldSubmitted: (String? value) {
          return onSubmit!(value);
        },
        style: TextStyle(
          color: Colors.white,
        ),
        controller: textFieldController,
        obscureText: isSecure,
        maxLines: lineHeight,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          errorStyle: const TextStyle(
            fontSize: 16,
          ),
          filled: true,
          fillColor: filledColor,
          hintText: hintText,
          prefixIcon: prefixWidget,
          suffixIcon: suffixWidget,
          labelStyle: TextStyle(
            fontSize: labelFontSize,
          ),
          hintStyle: TextStyle(
            fontSize: hintFontSize,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0,
                style: BorderStyle.none,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              width: 0.5,
              style: BorderStyle.solid,
              color: borderColor,
            ),
          ),
        ),
        validator: (String? value) {
          return validateTextField!(value);
        },
      ),
    );
  }
}

class CustomerCard extends StatelessWidget {
  var nameController = TextEditingController();
  var bankIdController = TextEditingController();
 Map model;
 VoidCallback function;
 CustomerCard({
   required this.model,
    required this.function,
}) ;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            'Customer',
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                //Data Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    ModTextFormField(
                      width: 55.w,
                      height: 5.h,
                      hintFontSize: 14.sp,
                      hintText:'${model['name']}',
                      onSubmit: (value) {},
                      validateTextField: (String? val) {},
                      inputColor: Colors.white,
                      filledColor: primaryColor,
                      borderRadius: 5.0,
                      borderColor: Colors.grey,
                    ),
                    // Second Section for back ID
                    Text(
                      'Bank ID',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    ModTextFormField(
                      hintFontSize: 14.sp,
                      width: 55.w,
                      height: 5.h,
                      hintText: '${model['bank_id']}',
                      onSubmit: (value) {},
                      validateTextField: (String? val) {},
                      inputColor: Colors.white,
                      filledColor: primaryColor,
                      borderRadius: 5.0,
                      borderColor: Colors.grey,
                    ),
                  ],
                ),
                //Picture and Transfer button column
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/profile.png',
                      width: 15.w,
                    ),
                    Text(
                      '${model['money']}\$',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    defaultButton(
                      FontSize: 10.sp,
                      text: 'Transfer',
                      buttonHeight: 4.h,
                      background: secondaryColor!,
                      buttonWidth: 27.w,
                      isUpperCase: true,
                      radius: 10,
                      function: function,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          )
        ],
      ),
    );
  }
}

Widget customersBuilder({
  required List<Map> customers,
})=>ConditionalBuilder(
  condition: customers.length>0,
  builder: (context)=>ListView.separated(
    itemBuilder: (context,index)=>CustomerCard(function: (){
      print('This Work');
    },model:customers[index]),
    separatorBuilder: (context,index)=>myDivider(),
    itemCount: customers.length,
  ),
  fallback: (context)=>Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 100,
          color: Colors.grey,
        ),
        Text(
          'No Customers Yet, Please Add Some Customers',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
);