import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common_wigets/fade_in_animation/animation_design.dart';
import 'package:login_app/src/common_wigets/fade_in_animation/fade_in_animation_model.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/controllers/fade_in_animation_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
    return Scaffold(
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 2000,
            animate: TAnimatePosition(
                topAfter: 0, topBefore: -30, leftAfter: 0, leftBefore: -30, rightAfter: 0, rightBefore: 0),
            child: const Image(
              opacity: AlwaysStoppedAnimation(0.8),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              image: AssetImage(tSplashTopIcon),
            ),
          ),
          TFadeInAnimation(
            durationInMs: 2000,
            animate: TAnimatePosition(
                topAfter: 160,
                topBefore: 160,
                leftAfter: tDefaultSize,
                leftBefore: -80),
            child: Column(
              children: [
                Text(tAppName, style: Theme.of(context).textTheme.bodySmall),
                Text(
                  tAppTagLine,
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          ),
          TFadeInAnimation(
            durationInMs: 2500,
            animate: TAnimatePosition(bottomAfter: 190, bottomBefore: 0),
            child: const Image(
              image: AssetImage(tSplashImage),
            ),
          ),
          TFadeInAnimation(
            durationInMs: 2500,
            animate: TAnimatePosition(bottomAfter: 60, bottomBefore: 0, rightAfter: 20,rightBefore: 20),
            child: Container(
              width: tSplashContainerSize,
              height: tSplashContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: tPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
