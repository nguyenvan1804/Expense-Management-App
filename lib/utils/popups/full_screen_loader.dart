import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "../../common/widgets/loaders/animation_loader.dart";
import "../constants/colors.dart";
import '../helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialog.
class TFullScreenLoader {

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, // Use Set.overlayContext for overlay dialogs
      barrierDismissible: false, // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark: TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column (
            children: [
              // const SizedBox(height: 250), // Adjust the spacing as needed
              TAnimationLoaderWidget(text: text, animation: animation),
            ]
          )
        )
      )
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop(); //close the dialog using Navigator
  }
}

