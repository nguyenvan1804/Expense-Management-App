import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_signup_project/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:login_signup_project/features/personalization/screens/settings/settings.dart';
import 'package:login_signup_project/screens_home/home_screen.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../signup/signup.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              /// Remember Me
              Row(children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.deepPurple;
                    } else {
                      return Colors.transparent;
                    }
                  }),
                ),
                const Text(TTexts.rememberMe),
              ]),

              /// Forget Password
              TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(TTexts.forgetPassword)),
            ]),
            const SizedBox(height: TSizes.spaceBtwSections),

            ///Sign in Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const HomeScreen()),
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.deepPurple),
                      backgroundColor:
                          dark ? TColors.primary : TColors.primary),
                  child: const Text(TTexts.signIn),
                )),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.deepPurple)),
                    child: const Text(TTexts.createAccount))),
            // const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
