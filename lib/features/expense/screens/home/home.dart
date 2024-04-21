import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_bar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          /// Header Tutorial [Section #3, Video # 2]
          TPrimaryHeaderContainer(
              child: Column(children: [
            TAppBar(
              title: Column(children: [
                Text(TTexts.homeAppbarTitle,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: TColors.grey)),
                Text(TTexts.homeAppbarSubTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: TColors.white)),
              ]),
            )
          ])),
        ]),
      ),
    );
  }
}
