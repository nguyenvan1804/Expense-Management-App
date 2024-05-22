// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_signup_project/features/Controller/income_controller.dart';
import 'package:login_signup_project/features/model/income_model.dart';
import 'package:login_signup_project/screens_home/NotificationScreen.dart';
import 'package:login_signup_project/utils/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_utils/get_utils.dart';

import '../common/widgets/images/t_circular_images.dart';
import '../features/detail_transaction/detail_transaction.dart';
import '../features/personalization/user_controller.dart';
import '../utils/constants/image_strings.dart';
import '../utils/shimmer/shimmer.dart';
import 'TransacsionScreen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final incomeController = Get.put(IncomeController());
    final controller = Get.put(UserController());

    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20).copyWith(top: 40),
          // padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //circle avatar
                  Obx(() {
                    final networkImage = controller.user.value.profilePicture;
                    final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                    return controller.imageUploading.value
                        ? const TShimmerEffect(width: 80, height: 80, radius: 80)
                        : TCircularImage(image: image, width: 65, height: 65, isNetworkImage: networkImage.isNotEmpty);
                  }),

                  const Row(
                    children: [
                      Icon(CupertinoIcons.chevron_down, size: 15),
                      SizedBox(width: 5.0),
                      Text("October"),
                    ],
                  ),
                  //bell icon
                  IconButton(
                    icon: Icon(CupertinoIcons.bell_fill,
                        color: AppColors.violetColor),
                    onPressed: () => Get.to(() => const NotificationScreen()),
                  ),
                ],
              ),
              const Text(
                'Account Balance',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF90909F),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 50,
                child: Text(
                  '\$9400',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF161719),
                    fontSize: 40,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      height: 80,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 8, 123, 68),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(CupertinoIcons.add_circled,
                              color: Colors.white, size: 30),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Income",
                                  style: TextStyle(color: Colors.white)),
                              Text("\$5000",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      // width: 200,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(CupertinoIcons.minus_circle,
                              color: Colors.white, size: 30),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Expenses",
                                  style: TextStyle(color: Colors.white)),
                              Text("\$1200",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: const Text(
                  'Spend Frequency',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF161719),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //image chart
              Image.asset('assets/images/chart.png',
                  height: 200, width: double.maxFinite),

              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFFBFBFB)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFCEED3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Today',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFFCAC12),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0.09,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Opacity(
                              opacity: 0.80,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 8),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Week',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF90909F),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0.09,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.80,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 8),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Month',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF90909F),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0.09,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Year',
                                    style: TextStyle(
                                      color: Color(0xFF90909F),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0.09,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //Recent Transactions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Transactions',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF161719),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      //See all Button
                      TextButton(
                          onPressed: () {
                            //
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TransacsionScreen()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 251, 227, 255),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "See all",
                              style: TextStyle(
                                color: AppColors.violetColor,
                                fontSize: 14,
                              ),
                            ),
                          )

                          // Container(
                          //   decoration: BoxDecoration(
                          //       color: Colors.purpleAccent.withOpacity(0.3),
                          //       borderRadius: BorderRadius.circular(20)),
                          //   child: Text("See all",
                          //       style: TextStyle(color: AppColors.violetColor)),
                          // ),
                          ),
                    ],
                  ),

                  // GestureDetector(
                  //   onTap: () {
                  //     // Điều hướng đến DetailScreen khi nhấn vào phần tử
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => DetailTransaction()),
                  //     );
                  //   },
                  //   child: Container(
                  //     // height: 80,
                  //     padding: EdgeInsets.all(15),
                  //     decoration: BoxDecoration(
                  //         color: Colors.grey[100],
                  //         borderRadius: BorderRadius.circular(20)),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Container(
                  //           width: 50,
                  //           height: 50,
                  //           padding: const EdgeInsets.all(10),
                  //           decoration: ShapeDecoration(
                  //             color: Colors.amber,
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(14),
                  //             ),
                  //           ),
                  //           child: Icon(
                  //             Icons.shopping_cart_sharp,
                  //             color: AppColors.iconColor,
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 15,
                  //         ),
                  //         Expanded(
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text("Shopping",
                  //                   style: TextStyle(
                  //                       color: AppColors.mainBlackColor,
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w500)),
                  //               const SizedBox(height: 5),
                  //               Text("Buy some grocery",
                  //                   style: TextStyle(
                  //                       color: AppColors.paraColor,
                  //                       fontSize: 13,
                  //                       fontWeight: FontWeight.w500)),
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 10,
                  //         ),
                  //         Column(
                  //           children: [
                  //             const Text("- \$120",
                  //                 style: TextStyle(
                  //                     color: Colors.red,
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.w600)),
                  //             const SizedBox(height: 10),
                  //             Text("10:00 AM",
                  //                 style: TextStyle(
                  //                     color: AppColors.paraColor,
                  //                     fontSize: 13,
                  //                     fontWeight: FontWeight.w500)),
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // GestureDetector(
                  //   onTap: () {
                  //     // Điều hướng đến DetailScreen khi nhấn vào phần tử
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => DetailTransaction()),
                  //     );
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.all(15),
                  //     decoration: BoxDecoration(
                  //         color: Colors.grey[100],
                  //         borderRadius: BorderRadius.circular(20)),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Container(
                  //           width: 50,
                  //           height: 50,
                  //           padding: const EdgeInsets.all(10),
                  //           decoration: ShapeDecoration(
                  //             color: const Color.fromARGB(255, 169, 182, 241),
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(10),
                  //             ),
                  //           ),
                  //           child: Icon(
                  //             Icons.edit_note_rounded,
                  //             color: AppColors.iconColor,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 15,
                  //         ),
                  //         Expanded(
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text("Subscription",
                  //                   style: TextStyle(
                  //                       color: AppColors.mainBlackColor,
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w500)),
                  //               const SizedBox(height: 5),
                  //               Text("Disney+ Annual...",
                  //                   style: TextStyle(
                  //                       color: AppColors.paraColor,
                  //                       fontSize: 13,
                  //                       fontWeight: FontWeight.w500)),
                  //             ],
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.end,
                  //           children: [
                  //             const Text("- \$80",
                  //                 style: TextStyle(
                  //                     color: Colors.red,
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.w600)),
                  //             const SizedBox(height: 10),
                  //             Text("03:30 PM",
                  //                 style: TextStyle(
                  //                     color: AppColors.paraColor,
                  //                     fontSize: 13,
                  //                     fontWeight: FontWeight.w500)),
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Obx(() {
                    return incomeController.isLoading.value == false
                        ? ListView.builder(
                            // physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: incomeController.incomeList.length,
                            itemBuilder: (context, index) {
                              final IncomeModel income =
                                  incomeController.incomeList[index];
                              return GestureDetector(
                                onTap: () {
                                  // Điều hướng đến DetailScreen khi nhấn vào phần tử
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailTransaction()),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  // height: 80,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        padding: const EdgeInsets.all(10),
                                        decoration: ShapeDecoration(
                                          color: Colors.amber,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.shopping_cart_sharp,
                                          color: AppColors.iconColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(income.category ?? "",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .mainBlackColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            const SizedBox(height: 5),
                                            Text(income.description ?? "",
                                                style: TextStyle(
                                                    color: AppColors.paraColor,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        children: [
                                          Text("\$${income.ammount}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                          const SizedBox(height: 10),
                                          Text(income.date ?? "",
                                              style: TextStyle(
                                                  color: AppColors.paraColor,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : const Center(child: CircularProgressIndicator());
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: const BorderRadius.vertical(
      //     top: Radius.circular(20),
      //   ),
      //   child: BottomNavigationBar(
      //     backgroundColor: Colors.white,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     elevation: 3,
      //     type: BottomNavigationBarType.fixed,
      //     items: const [
      //       BottomNavigationBarItem(
      //           icon: Icon(CupertinoIcons.home), label: "Home"),
      //       BottomNavigationBarItem(
      //           icon: Icon(CupertinoIcons.pause_fill), label: "Transaction"),
      //       BottomNavigationBarItem(
      //           icon: Icon(CupertinoIcons.chart_pie_fill), label: "Statistics"),
      //       BottomNavigationBarItem(
      //           icon: Icon(CupertinoIcons.person), label: "Profile"),
      //     ],
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   shape: const CircleBorder(),
      //   backgroundColor: AppColors.violetColor,
      //   child: const Icon(
      //     CupertinoIcons.add,
      //     color: Colors.white,
      //     size: 20,
      //   ),
      // ),
    );
  }
}
