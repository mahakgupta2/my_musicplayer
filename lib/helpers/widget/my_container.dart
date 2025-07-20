
import 'package:app/app_colors.dart';
import 'package:flutter/cupertino.dart';

class MyContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool isPressed;
  const MyContainer({super.key,
    required this.child,
    this.isPressed = false,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.lightbackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isPressed ? [
          BoxShadow(
            color: AppColors.darkbackground,
            offset: Offset(2,2),
            blurRadius: 5,
            spreadRadius: 1
          ),
          BoxShadow(
              color: AppColors.darkbackground,
              offset: Offset(-2,-2),
              blurRadius: 5,
              spreadRadius: 1
          ),


        ]:[
          BoxShadow(
              color: AppColors.darkbackground,
              offset: Offset(8,8),
              blurRadius: 15,
              spreadRadius: 1
          ),
          BoxShadow(
              color: AppColors.darkbackground,
              offset: Offset(-8,-8),
              blurRadius: 15,
              spreadRadius: 1
          ),

        ]
      ),
      child: child,

    );
  }
}

