import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../common/widgets/app_bar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          // Header
          TPrimaryHeaderContainer(
            child: Column(
              children: [
                // AppBar
                AppBar(
                  title: Text(
                    'Notifications',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: Colors.white),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
          // Body
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace - 24.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      extentRatio: .3,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          icon: Icons.reply,
                          backgroundColor: Colors.grey[300]!
                        ),
                        SlidableAction(
                            onPressed: (context) {},
                            icon: Icons.delete,
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red[700]!,
                        )
                      ]
                    ),
                    child: ListTile(
                      isThreeLine: true,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.08),
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/logos/budget.png'),
                      ),
                      title: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Reportage Antonio",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "10:30",
                              style: TextStyle(fontSize: 12),
                            ),
                          ]),
                      subtitle: const Text(
                        "Please make the presentation before Friday, Please make the presentation before Friday.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[400],
                  indent: size.width * .08,
                  endIndent: size.width * .08,
                ),
                itemCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../../../common/widgets/app_bar/appbar.dart';
// import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
// import '../../../../utils/constants/colors.dart';
// import '../../../../utils/constants/sizes.dart';
//
// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(children: [
//           /// --Header
//           TPrimaryHeaderContainer(
//             child: Column(children: [
//               /// AppBar
//               TAppBar(
//                   title: Text('Notifications',
//                       style: Theme.of(context)
//                           .textTheme
//                           .headlineMedium!
//                           .apply(color: TColors.white))),
//               const SizedBox(height: TSizes.spaceBtwSections),
//             ]),
//           ),
//
//           ///Body
//           Padding(
//               padding: EdgeInsets.all(TSizes.defaultSpace),
//               child: Column(children: [
//                 Expanded(
//                     child: ListView.separated(
//                         itemBuilder: (context, index) {
//                           return const ListTile(
//                             isThreeLine: true,
//                             leading: CircleAvatar(
//                               radius: 25,
//                               backgroundImage:
//                                   AssetImage('assets/logos/budget.png'),
//                             ),
//                             title: Text("Shopping budget has exceeds."),
//                             subtitle: Text(
//                                 "Please make the presentation before friday, the next make the presentation before friday.",
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis),
//                           );
//                         },
//                         separatorBuilder: (context, index) => Divider(),
//                         itemCount: 10
//                     )
//                 ),
//                 const SizedBox(height: TSizes.spaceBtwSections * 2.5),
//               ])), // Padding
//         ]),
//       ),
//     );
//   }
// }


