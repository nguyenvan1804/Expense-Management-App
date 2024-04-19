import 'package:flutter/material.dart';
import 'package:login_signup_project/core/app_routes.dart';

import '../onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    animation.addListener(() {
      if (mounted) setState(() {});
    });
    animationController.forward();

    // Future.delayed(const Duration(seconds: 2))
    //     .then((value) => Navigator.popAndPushNamed(context, AppRoutes.onboard));

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/on_boarding_images/splash_screen.png',
              height: animation.value * 300,
            ),
            Text('Welcome to Expense Management App',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}