import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_signup_project/features/personalization/user_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/shimmer/shimmer.dart';
import '../images/t_circular_images.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : TImages.user;
        return ClipOval(
          child: controller.imageUploading.value
              ? const TShimmerEffect(width: 80, height: 80, radius: 80)
              : TCircularImage(image: image, width: 50, height: 50, isNetworkImage: networkImage.isNotEmpty),
        );
      }),
      title: Text(controller.user.value.fullName, style: Theme.of (context).textTheme.headlineSmall!.apply(color: TColors.white)),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white)),
    );
  }
}