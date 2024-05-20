// ignore_for_file: prefer_const_constructors

import '../utils/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../features/detail_transaction/detail_transaction.dart';

class TransacsionScreen extends StatelessWidget {
  const TransacsionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //app bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white30,
                      border: Border.all(color: Colors.grey)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //drop down icon
                      Icon(
                        Icons.arrow_downward,
                        size: 15,
                      ),
                      Text(
                        "Month",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    showModalBottomSheet(
                        context: context,
                        useRootNavigator: true,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 800,
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                //fillter and reset button
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 22.0, top: 25),
                                      child: const Text(
                                        "Fillter Trasaction",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    //button reset
                                    Container(
                                        margin: const EdgeInsets.only(
                                            right: 20, top: 25),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.purple[100],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text(
                                          "Reset",
                                          //style: TextStyle(color: AppColors.violetColor)),
                                        ))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 22.0),
                                  child: Text("Filter By",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 10),
                                      child: Text("Income"),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.black38)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 10),
                                      child: Text("Expense"),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.black38)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 10),
                                      child: Text("Transfer"),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.black38)),
                                    ),
                                  ],
                                ),
                                //sort by
                                Padding(
                                  padding: const EdgeInsets.only(left: 22.0),
                                  child: Text("Sort By",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 10),
                                      child: Text("Highest"),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.black38)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 10),
                                      child: Text("Lowest"),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.black38)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 10),
                                      child: Text("Newest"),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.black38)),
                                    ),
                                  ],
                                ),

                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 28, vertical: 10),
                                  child: Text("Oldest"),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Colors.black38)),
                                ),
                                //category
                                Padding(
                                  padding: const EdgeInsets.only(left: 22.0),
                                  child: Text("Category",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Choose category",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        //text
                                        children: [
                                          Text("0 Selected"),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(Icons.arrow_forward_ios_outlined)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blueAccent),
                                        padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              horizontal: 120, vertical: 20),
                                        ),
                                      ),
                                      child: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 60, right: 60),
                                          child: Text(
                                            "Apply",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                  },
                  child: Container(
                      padding: const EdgeInsets.all(7),
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Color.fromARGB(255, 193, 191, 191))),
                      child: Image.asset('assets/icons/transaction/sort.png')),
                )
              ],
            ),
          ),

          Expanded(
              // margin: const EdgeInsets.all(10),
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Today",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    // Điều hướng đến DetailScreen khi nhấn vào phần tử
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailTransaction()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                            color: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Shopping",
                                  style: TextStyle(
                                      color: AppColors.mainBlackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(height: 5),
                              Text("Buy some grocery",
                                  style: TextStyle(
                                      color: AppColors.paraColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            const Text("- \$120",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 10),
                            Text("10:00 AM",
                                style: TextStyle(
                                    color: AppColors.paraColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    // Điều hướng đến DetailScreen khi nhấn vào phần tử
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailTransaction()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                            color: Colors.red[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child:
                              Image.asset('assets/icons/transaction/food.png'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Food",
                                  style: TextStyle(
                                      color: AppColors.mainBlackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(height: 5),
                              Text("Buy a ramen",
                                  style: TextStyle(
                                      color: AppColors.paraColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            const Text("- \$120",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 10),
                            Text("10:00 AM",
                                style: TextStyle(
                                    color: AppColors.paraColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Yesterday",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Điều hướng đến DetailScreen khi nhấn vào phần tử
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailTransaction()),
                    );
                  },
                  child: Container(
                    // height: 80,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                            color: Colors.green[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child:
                              Image.asset('assets/icons/transaction/money.png'),
                          // Icon(
                          //   Icons.shopping_cart_sharp,
                          //   color: AppColors.iconColor,
                          // ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Salary",
                                  style: TextStyle(
                                      color: AppColors.mainBlackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(height: 5),
                              Text("Salary for July",
                                  style: TextStyle(
                                      color: AppColors.paraColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            const Text(
                              "+ \$120",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 10),
                            Text("10:00 AM",
                                style: TextStyle(
                                    color: AppColors.paraColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Container(
            //       margin: EdgeInsets.only(left: 20),
            //       child: Text(
            //         "Today",
            //         textAlign: TextAlign.start,
            //         style: TextStyle(
            //           fontSize: 25,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 20,
            //     ),
            //     Row(
            //       children: [
            //         Expanded(
            //           child: Container(
            //             margin: const EdgeInsets.symmetric(horizontal: 25),
            //             padding: EdgeInsets.all(10),
            //             decoration: BoxDecoration(
            //                 color: Colors.grey[100],
            //                 borderRadius: BorderRadius.circular(20)),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Container(
            //                   margin: EdgeInsets.only(left: 10),
            //                   child: Row(
            //                     children: [
            //                       Container(
            //                         padding: EdgeInsets.all(15),
            //                         height: 60,
            //                         child: Image.asset(
            //                             'assets/icons/transaction/shopping.png'),
            //                         decoration: BoxDecoration(
            //                             color: Colors.amber,
            //                             shape: BoxShape.rectangle,
            //                             borderRadius: BorderRadius.circular(10)),
            //                       ),
            //                       Padding(
            //                         padding: const EdgeInsets.only(left: 10),
            //                         child: Container(
            //                           child: Column(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.spaceBetween,
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               Container(
            //                                 padding: EdgeInsets.only(bottom: 10),
            //                                 child: Text("Shopping",
            //                                     style: TextStyle(
            //                                         color:
            //                                             AppColors.mainBlackColor,
            //                                         fontSize: 16,
            //                                         fontWeight: FontWeight.w500)),
            //                               ),
            //                               Container(
            //                                 padding: EdgeInsets.only(top: 10),
            //                                 child: Text("Buy some grocery",
            //                                     style: TextStyle(
            //                                         color: AppColors.paraColor,
            //                                         fontSize: 13,
            //                                         fontWeight: FontWeight.w500)),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //                 Container(
            //                   margin: EdgeInsets.all(10),
            //                   child: Column(
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Container(
            //                         padding: EdgeInsets.only(bottom: 10),
            //                         child: Text("- \$120",
            //                             style: TextStyle(
            //                                 color: Colors.red,
            //                                 fontSize: 16,
            //                                 fontWeight: FontWeight.w600)),
            //                       ),
            //                       Container(
            //                         padding: EdgeInsets.only(top: 10),
            //                         child: Text("10:00 AM",
            //                             style: TextStyle(
            //                                 color: AppColors.paraColor,
            //                                 fontSize: 13,
            //                                 fontWeight: FontWeight.w500)),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //     // Container(
            //     //   margin: const EdgeInsets.symmetric(horizontal: 25),
            //     //   padding: EdgeInsets.all(10),
            //     //   decoration: BoxDecoration(
            //     //       color: Colors.grey[100],
            //     //       borderRadius: BorderRadius.circular(20)),
            //     //   child: Row(
            //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     //     children: [
            //     //       Container(
            //     //         margin: EdgeInsets.only(left: 10),
            //     //         child: Row(
            //     //           children: [
            //     //             Container(
            //     //               padding: EdgeInsets.all(15),
            //     //               height: 60,
            //     //               child: Image.asset(
            //     //                   'assets/icons/transaction/shopping.png'),
            //     //               decoration: BoxDecoration(
            //     //                   color: Colors.amber,
            //     //                   shape: BoxShape.rectangle,
            //     //                   borderRadius: BorderRadius.circular(10)),
            //     //             ),
            //     //             Padding(
            //     //               padding: const EdgeInsets.only(left: 10),
            //     //               child: Container(
            //     //                 child: Column(
            //     //                   mainAxisAlignment:
            //     //                       MainAxisAlignment.spaceBetween,
            //     //                   crossAxisAlignment: CrossAxisAlignment.start,
            //     //                   children: [
            //     //                     Container(
            //     //                       padding: EdgeInsets.only(bottom: 10),
            //     //                       child: Text("Shopping",
            //     //                           style: TextStyle(
            //     //                               color: AppColors.mainBlackColor,
            //     //                               fontSize: 16,
            //     //                               fontWeight: FontWeight.w500)),
            //     //                     ),
            //     //                     Container(
            //     //                       padding: EdgeInsets.only(top: 10),
            //     //                       child: Text("Buy some grocery",
            //     //                           style: TextStyle(
            //     //                               color: AppColors.paraColor,
            //     //                               fontSize: 13,
            //     //                               fontWeight: FontWeight.w500)),
            //     //                     ),
            //     //                   ],
            //     //                 ),
            //     //               ),
            //     //             )
            //     //           ],
            //     //         ),
            //     //       ),
            //     //       Container(
            //     //         margin: EdgeInsets.all(10),
            //     //         child: Column(
            //     //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     //           children: [
            //     //             Container(
            //     //               padding: EdgeInsets.only(bottom: 10),
            //     //               child: Text("- \$120",
            //     //                   style: TextStyle(
            //     //                       color: Colors.red,
            //     //                       fontSize: 16,
            //     //                       fontWeight: FontWeight.w600)),
            //     //             ),
            //     //             Container(
            //     //               padding: EdgeInsets.only(top: 10),
            //     //               child: Text("10:00 AM",
            //     //                   style: TextStyle(
            //     //                       color: AppColors.paraColor,
            //     //                       fontSize: 13,
            //     //                       fontWeight: FontWeight.w500)),
            //     //             ),
            //     //           ],
            //     //         ),
            //     //       ),
            //     //     ],
            //     //   ),
            //     // ),
            //     // SizedBox(height: 20),
            //     Container(
            //       margin: const EdgeInsets.symmetric(horizontal: 25),
            //       padding: EdgeInsets.all(10),
            //       decoration: BoxDecoration(
            //           color: Colors.grey[100],
            //           borderRadius: BorderRadius.circular(20)),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Container(
            //             margin: EdgeInsets.only(left: 10),
            //             child: Row(
            //               children: [
            //                 Container(
            //                   padding: EdgeInsets.all(15),
            //                   height: 60,
            //                   child: Image.asset(
            //                       'assets/icons/transaction/subcription.png'),
            //                   decoration: BoxDecoration(
            //                       color: Colors.purple[100],
            //                       shape: BoxShape.rectangle,
            //                       borderRadius: BorderRadius.circular(10)),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 10),
            //                   child: Container(
            //                     child: Column(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Container(
            //                           padding: EdgeInsets.only(bottom: 10),
            //                           child: Text("Subscription",
            //                               style: TextStyle(
            //                                   color: AppColors.mainBlackColor,
            //                                   fontSize: 16,
            //                                   fontWeight: FontWeight.w500)),
            //                         ),
            //                         Container(
            //                           padding: EdgeInsets.only(top: 10),
            //                           child: Text("Disney + Annual...",
            //                               style: TextStyle(
            //                                   color: AppColors.paraColor,
            //                                   fontSize: 13,
            //                                   fontWeight: FontWeight.w500)),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Container(
            //             margin: EdgeInsets.all(10),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Container(
            //                   padding: EdgeInsets.only(bottom: 10),
            //                   child: Text("- \$80",
            //                       style: TextStyle(
            //                           color: Colors.red,
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w600)),
            //                 ),
            //                 Container(
            //                   padding: EdgeInsets.only(top: 10),
            //                   child: Text("03:30 PM",
            //                       style: TextStyle(
            //                           color: AppColors.paraColor,
            //                           fontSize: 13,
            //                           fontWeight: FontWeight.w500)),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(height: 20),
            //     Container(
            //       margin: const EdgeInsets.symmetric(horizontal: 25),
            //       padding: EdgeInsets.all(10),
            //       decoration: BoxDecoration(
            //           color: Colors.grey[100],
            //           borderRadius: BorderRadius.circular(20)),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Container(
            //             margin: EdgeInsets.only(left: 10),
            //             child: Row(
            //               children: [
            //                 Container(
            //                   padding: EdgeInsets.all(15),
            //                   height: 60,
            //                   child: Image.asset(
            //                       'assets/icons/transaction/food.png'),
            //                   decoration: BoxDecoration(
            //                       color: Colors.red[200],
            //                       shape: BoxShape.rectangle,
            //                       borderRadius: BorderRadius.circular(10)),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 10),
            //                   child: Container(
            //                     child: Column(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Container(
            //                           padding: EdgeInsets.only(bottom: 10),
            //                           child: Text("Food",
            //                               style: TextStyle(
            //                                   color: AppColors.mainBlackColor,
            //                                   fontSize: 16,
            //                                   fontWeight: FontWeight.w500)),
            //                         ),
            //                         Container(
            //                           padding: EdgeInsets.only(top: 10),
            //                           child: Text("Buy a ramen",
            //                               style: TextStyle(
            //                                   color: AppColors.paraColor,
            //                                   fontSize: 13,
            //                                   fontWeight: FontWeight.w500)),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Container(
            //             margin: EdgeInsets.all(10),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Container(
            //                   padding: EdgeInsets.only(bottom: 10),
            //                   child: Text("- \$32",
            //                       style: TextStyle(
            //                           color: Colors.red,
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w600)),
            //                 ),
            //                 Container(
            //                   padding: EdgeInsets.only(top: 10),
            //                   child: Text("07:30 PM",
            //                       style: TextStyle(
            //                           color: AppColors.paraColor,
            //                           fontSize: 13,
            //                           fontWeight: FontWeight.w500)),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     Container(
            //       margin: EdgeInsets.only(left: 20),
            //       child: Text(
            //         "Yesterday",
            //         style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     SizedBox(height: 20),
            //     Container(
            //       margin: const EdgeInsets.symmetric(horizontal: 25),
            //       padding: EdgeInsets.all(10),
            //       decoration: BoxDecoration(
            //           color: Colors.grey[100],
            //           borderRadius: BorderRadius.circular(20)),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Container(
            //             margin: EdgeInsets.only(left: 10),
            //             child: Row(
            //               children: [
            //                 Container(
            //                   padding: EdgeInsets.all(15),
            //                   height: 60,
            //                   child: Image.asset(
            //                       'assets/icons/transaction/money.png'),
            //                   decoration: BoxDecoration(
            //                       color: Colors.green[200],
            //                       shape: BoxShape.rectangle,
            //                       borderRadius: BorderRadius.circular(10)),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 10),
            //                   child: Container(
            //                     child: Column(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Container(
            //                           padding: EdgeInsets.only(bottom: 10),
            //                           child: Text("Salary",
            //                               style: TextStyle(
            //                                   color: AppColors.mainBlackColor,
            //                                   fontSize: 16,
            //                                   fontWeight: FontWeight.w500)),
            //                         ),
            //                         Container(
            //                           padding: EdgeInsets.only(top: 10),
            //                           child: Text("Salary for July",
            //                               style: TextStyle(
            //                                   color: AppColors.paraColor,
            //                                   fontSize: 13,
            //                                   fontWeight: FontWeight.w500)),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Container(
            //             margin: EdgeInsets.all(10),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Container(
            //                   padding: EdgeInsets.only(bottom: 10),
            //                   child: Text("+ \$5000",
            //                       style: TextStyle(
            //                           color: Colors.green,
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w600)),
            //                 ),
            //                 Container(
            //                   padding: EdgeInsets.only(top: 10),
            //                   child: Text("04:30 PM",
            //                       style: TextStyle(
            //                           color: AppColors.paraColor,
            //                           fontSize: 13,
            //                           fontWeight: FontWeight.w500)),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(height: 20),
            //     Container(
            //       margin: const EdgeInsets.symmetric(horizontal: 25),
            //       padding: EdgeInsets.all(10),
            //       decoration: BoxDecoration(
            //           color: Colors.grey[100],
            //           borderRadius: BorderRadius.circular(20)),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Container(
            //             margin: EdgeInsets.only(left: 10),
            //             child: Row(
            //               children: [
            //                 Container(
            //                   padding: EdgeInsets.all(15),
            //                   height: 60,
            //                   child: Image.asset(
            //                       'assets/icons/transaction/transport.png'),
            //                   decoration: BoxDecoration(
            //                       color: Colors.blue[400],
            //                       shape: BoxShape.rectangle,
            //                       borderRadius: BorderRadius.circular(10)),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 10),
            //                   child: Container(
            //                     child: Column(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Container(
            //                           padding: EdgeInsets.only(bottom: 10),
            //                           child: Text("Transportation",
            //                               style: TextStyle(
            //                                   color: AppColors.mainBlackColor,
            //                                   fontSize: 16,
            //                                   fontWeight: FontWeight.w500)),
            //                         ),
            //                         Container(
            //                           padding: EdgeInsets.only(top: 10),
            //                           child: Text("Charging Tesla",
            //                               style: TextStyle(
            //                                   color: AppColors.paraColor,
            //                                   fontSize: 13,
            //                                   fontWeight: FontWeight.w500)),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Container(
            //             margin: EdgeInsets.all(10),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Container(
            //                   padding: EdgeInsets.only(bottom: 10),
            //                   child: Text("- \$18",
            //                       style: TextStyle(
            //                           color: Colors.red,
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w600)),
            //                 ),
            //                 Container(
            //                   padding: EdgeInsets.only(top: 10),
            //                   child: Text("08:30 PM",
            //                       style: TextStyle(
            //                           color: AppColors.paraColor,
            //                           fontSize: 13,
            //                           fontWeight: FontWeight.w500)),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          )),
        ]),
      ),
    );
  }
}
