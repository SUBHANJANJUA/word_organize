import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CheckButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 5,
          shadowColor: Colors.orange.withOpacity(0.5),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
