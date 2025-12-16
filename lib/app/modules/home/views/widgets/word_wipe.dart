import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WordWipe extends StatelessWidget {
  const WordWipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The Outline (Stroke)
        Text(
          'Word Wipe!',
          style: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = Colors.pinkAccent.shade100, // Border color
          ),
        ),
        // The Inner Fill
        Text(
          'Word Wipe!',
          style: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Inner text color
          ),
        ),
      ],
    );
  }
}
