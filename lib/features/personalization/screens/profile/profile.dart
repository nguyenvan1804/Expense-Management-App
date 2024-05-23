import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_signup_project/features/personalization/screens/profile/widgets/profile_menu.dart';

import '../../../../common/widgets/app_bar/appbar.dart';
import '../../../../common/widgets/images/t_circular_images.dart';
import '../../../../common/widgets/list_tiles/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/shimmer/shimmer.dart';
import '../../user_controller.dart';
import '../change_name/change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Profile')),

      /// -- Body
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Profile Picture
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Obx(() {
                        final networkImage = controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                        return controller.imageUploading.value
                            ? const TShimmerEffect(width: 80, height: 80, radius: 80)
                            : TCircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                      }),
                      TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),
                    ]
                  ),
                ),

                /// Details
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                ///Heading profile Info
                const TSectionHeading(title: 'Profile Information', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName())),
                TProfileMenu(title: 'Username', value: controller.user.value.username, onPressed: () {  },),

                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// Heading Personal Info
                const TSectionHeading(title: "Personal Information", showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(title: "User ID", value: controller.user.value.id, onPressed: () {}),
                TProfileMenu(title: "E-mail", value: controller.user.value.email, onPressed: () {}),
                TProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () {}),
                TProfileMenu(title: "Sender", value: 'Male', onPressed: () {}),
                TProfileMenu(title: "Date of Birth", value: '10 Oct, 1994', onPressed: (){}),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                Center(
                  child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text( 'Close Account', style: TextStyle(color: Colors.red)),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

