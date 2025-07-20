import 'package:app/app_colors.dart';
import 'package:flutter/cupertino.dart';


class MyButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  final EdgeInsetsGeometry? padding;
  final bool isPressed;
  final Color btnBackGround;
  final Color blurFirstColor;
  final Color blurSecondColor;

  const MyButton({
    super.key,
    required this.child,
    required this.onPress,
    this.padding,
    this.isPressed = false,
    this.blurFirstColor = AppColors.lightbackground,
    this.blurSecondColor = AppColors.darkbackground,
    this.btnBackGround = AppColors.darkbackground,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: padding ?? const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: btnBackGround,
          boxShadow: isPressed
              ? [
            BoxShadow(
              color: blurFirstColor,
              offset: const Offset(2, 2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
            const BoxShadow(
              offset: Offset(-2, -2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ]
              : [
            BoxShadow(
              color: blurFirstColor,
              offset: const Offset(6, 6),
              blurRadius: 8,
              spreadRadius: 1,
            ),
            const BoxShadow(
              offset: Offset(-6, -6),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
