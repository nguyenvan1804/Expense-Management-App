import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_signup_project/common/widgets/success_screen/success_screen.dart';
import 'package:login_signup_project/features/authentication/screens/logins/login.dart';
import 'package:login_signup_project/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear)),
      ]),
      body: SingleChildScrollView(
        //Padding to Give Default Equal Space on all sides in all screens.
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            /// Image
            Image(
              image: const AssetImage(TImages.deliveryEmail),
              width: THelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Title & SubTitle
            Text(TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Text('abc@gmail.com',
            //     style: Theme.of(context).textTheme.labelLarge,
            //     textAlign: TextAlign.center),
            // const SizedBox(height: TSizes.spaceBtwItems),

            /// Enter number verification
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number, // Bàn phím hiển thị chỉ số
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Chỉ cho phép nhập các ký tự số
                    ],
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number, // Bàn phím hiển thị chỉ số
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Chỉ cho phép nhập các ký tự số
                    ],
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number, // Bàn phím hiển thị chỉ số
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Chỉ cho phép nhập các ký tự số
                    ],
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number, // Bàn phím hiển thị chỉ số
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Chỉ cho phép nhập các ký tự số
                    ],
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number, // Bàn phím hiển thị chỉ số
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Chỉ cho phép nhập các ký tự số
                    ],
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            Text(TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Buttons
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(
                          () => SuccessScreen(
                            image: TImages.receiveEmail,
                            title: TTexts.yourAccountCreatedTitle,
                            subTitle: TTexts.yourAccountCreatedSubtitle,
                            onPressed: () => Get.to(() => const LoginScreen()),
                          ),
                        ),
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.deepPurple),
                        backgroundColor:
                        dark ? TColors.primary : TColors.primary),
                    child: const Text(TTexts.tContinue))),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: const Text(TTexts.resendEmail))),
          ]),
        ),
      ),
    );
  }
}
