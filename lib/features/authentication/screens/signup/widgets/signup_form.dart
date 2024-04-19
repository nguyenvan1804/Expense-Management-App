import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_signup_project/features/authentication/screens/signup/verify_email.dart';
import 'package:login_signup_project/features/authentication/screens/signup/widgets/terms_condition_checkboxs.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
        child: Column(
          children: [
            Row(
              children: [
                // /// First Name
                // Expanded(
                //   child: TextFormField(
                //     expands: false,
                //     decoration: const InputDecoration(
                //         labelText: TTexts.firstname,
                //         prefixIcon: Icon(Iconsax.user)),
                //   ),
                // ),
                // const SizedBox(width: TSizes.spaceBtwInputFields),
                // /// Last Name
                // Expanded(
                //   child: TextFormField(
                //     expands: false,
                //     decoration: const InputDecoration(
                //         labelText: TTexts.lastName,
                //         prefixIcon: Icon(Iconsax.user)),
                //   ),
                // ),
              ],
            ),
            // const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Username
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Email
            TextFormField(
              decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Phone Number
            // TextFormField(
            //   decoration: const InputDecoration(
            //       labelText: TTexts.phoneNo,
            //       prefixIcon: Icon(Iconsax.call)),
            // ),
            // const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: TTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Confirm Password
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: TTexts.confirmPassword,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Terms&Conditions Checkbox
            const TTermsAndConditionCheckbox(),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sign up button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const VerifyEmailScreen()),
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.deepPurple),
                        backgroundColor:
                        dark ? TColors.primary : TColors.primary),
                    child: const Text(TTexts.createAccount))),
          ],
        ));
    }
}

