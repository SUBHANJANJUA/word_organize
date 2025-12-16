import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool retake = false.obs;
  var topLetters = <String?>[null, null, null, null].obs;

  var topBorderColors = <Color>[
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ].obs;

  var bottomLetters = <String>['D', 'R', 'O', 'W'].obs;

  final correctWord = "WORD";

  void placeLetter(String letter, int index) {
    topLetters[index] = letter;
    topBorderColors[index] = Colors.grey;

    bottomLetters.remove(letter);
  }

  void checkWord() {
    HapticFeedback.lightImpact();
    String word = topLetters.join();
    if (word == correctWord) {
      topBorderColors.value = [
        Colors.green,
        Colors.green,
        Colors.green,
        Colors.green,
      ];
      retake.value = true;
    } else {
      topBorderColors.value = [Colors.red, Colors.red, Colors.red, Colors.red];
      retake.value = true;
    }
  }

  void removeLetter(int index) {
    final letter = topLetters[index];
    if (letter != null) {
      bottomLetters.add(letter);
    }
    topLetters[index] = null;
    topBorderColors[index] = Colors.grey;
  }

  // --------------------------
  // Reset function
  // --------------------------
  void resetGame() {
    topLetters.value = [null, null, null, null];

    topBorderColors.value = [
      Colors.grey,
      Colors.grey,
      Colors.grey,
      Colors.grey,
    ];

    bottomLetters.value = ['D', 'R', 'O', 'W'];

    retake.value = false;
  }
}
