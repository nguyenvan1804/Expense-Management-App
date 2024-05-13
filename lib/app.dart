import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:login_signup_project/bindings/general_bindings.dart';
import 'package:login_signup_project/utils/constants/colors.dart';
import 'package:login_signup_project/utils/theme/theme.dart';
import 'core/app_routes.dart';
import 'features/authentication/screens/onboarding/onboarding.dart';
import 'features/authentication/screens/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      /// Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
      // home: const OnBoardingScreen(),
      // const OnBoardingScreen(),
    );
  }
}
