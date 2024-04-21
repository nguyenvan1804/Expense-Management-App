import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/app_bar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/section_heading.dart';
import '../../../../common/widgets/list_tiles/setting_menu_tiles.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),

                  /// User Profile Card
                  TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen()),),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ]
              ),
            ),

            ///Body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column (
                children: [
                  /// Account Settings
                  TSectionHeading(title: 'Account Settings', showActionButton: false,),
                  SizedBox (height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set shopping delivery address'),
                  TSettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My cart', subTitle: 'Add, remove products and move to checkout'),
                  TSettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders' , subTitle: 'In-progress and Completed Orders'),
                  TSettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account'),
                  TSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),
                  TSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message'),
                  TSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                  /// App Settings
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: 'App Settings', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data!', subTitle: 'Upload Data to your Cloud Firebase'),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on Location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {})
                  ),

                  /// Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: (){}, child: const Text('Logout')),
                  ),
                  const SizedBox (height: TSizes.spaceBtwSections * 2.5),
                ]
              )
            ), // Padding
          ]
        ),
      ),
    );
  }
}

