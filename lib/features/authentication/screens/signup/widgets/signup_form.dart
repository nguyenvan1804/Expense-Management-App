import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_signup_project/features/authentication/controllers_signup/signup_controller.dart';
import 'package:login_signup_project/features/authentication/screens/signup/verify_email.dart';
import 'package:login_signup_project/features/authentication/screens/signup/widgets/terms_condition_checkboxs.dart';
import 'package:login_signup_project/utils/validators/validations.dart';
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
    final controller = Get.put(SignupController());

    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                /// First Name
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) => TValidator.validateEmptyText("First name", value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstname,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                /// Last Name
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) => TValidator.validateEmptyText("Last name", value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Username
            TextFormField(
              controller: controller.username,
              validator: (value) => TValidator.validateEmptyText("Username", value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Phone Number
            TextFormField(
              validator: (value) => TValidator.validatePhoneNumber(value),
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNo,
                  prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            Obx(
              () => TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed:() => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  )
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Confirm Password
            // TextFormField(
            //   obscureText: true,
            //   decoration: const InputDecoration(
            //     labelText: TTexts.confirmPassword,
            //     prefixIcon: Icon(Iconsax.password_check),
            //     suffixIcon: Icon(Iconsax.eye_slash),
            //   ),
            // ),
            // const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Terms&Conditions Checkbox
            const TTermsAndConditionCheckbox(),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sign up button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.signup(),
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.deepPurple),
                        backgroundColor:
                        dark ? TColors.primary : TColors.primary),
                    child: const Text(TTexts.createAccount))),
          ],
        ));
    }
}

