import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:techliance_task/app/modules/home/views/widgets/check_button.dart';
import 'package:techliance_task/app/modules/home/views/widgets/word_box.dart';
import 'package:techliance_task/app/modules/home/views/widgets/word_wipe.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Image.asset(
            'assets/images/bg_img.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              SizedBox(height: 150.h),

              WordWipe(),
              SizedBox(height: 20.h),

              // Top word container
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return DragTarget<String>(
                    onAccept: (letter) {
                      controller.placeLetter(letter, index);
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Obx(
                          () => WordBox(
                            borderColor: controller.topBorderColors[index],
                            letter: controller.topLetters[index],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),

              SizedBox(height: 50.h),

              Obx(
                () => controller.bottomLetters.isEmpty
                    ? SizedBox(height: 70.h)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.bottomLetters.length,
                          (index) {
                            final letter = controller.bottomLetters[index];
                            Color color;

                            switch (letter) {
                              case 'D':
                                color = Colors.yellow;
                                break;
                              case 'R':
                                color = Colors.blue;
                                break;
                              case 'O':
                                color = Colors.orange;
                                break;
                              case 'W':
                                color = Colors.purple;
                                break;
                              default:
                                color = Colors.grey;
                            }
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: WordBox(
                                borderColor: color,
                                letter: letter,
                                draggable: true,
                              ),
                            );
                          },
                        ),
                      ),
              ),

              SizedBox(height: 20.h),

              Obx(
                () => CheckButton(
                  title: controller.retake.value ? "RETAKE" : "CHECK",
                  onPressed: () {
                    controller.retake.value
                        ? controller.resetGame()
                        : controller.checkWord();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
