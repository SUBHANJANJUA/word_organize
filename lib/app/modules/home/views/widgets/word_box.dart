import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WordBox extends StatelessWidget {
  final Color borderColor;
  final String? letter;
  final bool draggable;
  final void Function(String)? onDragCompleted;

  const WordBox({
    Key? key,
    required this.borderColor,
    this.letter,
    this.draggable = false,
    this.onDragCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget box = Container(
      width: 70.w,
      height: 70.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade100,
        border: Border.all(color: borderColor, width: 3.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: letter != null
          ? Text(
              letter!,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: borderColor,
              ),
            )
          : null,
    );

    if (draggable && letter != null) {
      return Draggable<String>(
        data: letter!,
        feedback: Material(color: Colors.transparent, child: box),
        childWhenDragging: Container(
          width: 70.w,
          height: 70.w,
          color: Colors.grey.shade200,
        ),
        child: box,
        onDragCompleted: () {
          if (onDragCompleted != null) onDragCompleted!(letter!);
        },
      );
    }

    return box;
  }
}
