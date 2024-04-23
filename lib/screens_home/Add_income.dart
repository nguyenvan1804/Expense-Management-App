import 'package:login_signup_project/Widget/bottom_sheet.dart';
import 'package:login_signup_project/utils/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddInconme extends StatefulWidget {
  const AddInconme({super.key});

  @override
  State<AddInconme> createState() => _AddInconmeState();
}

class _AddInconmeState extends State<AddInconme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Income',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  // height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How much?",
                        style: TextStyle(color: AppColors.textColor),
                      ),
                      const Text(
                        "\$0",
                        style: TextStyle(color: Colors.white, fontSize: 48),
                      ),
                    ],
                  ),
                ),
                Container(
                  // height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    //top border radius
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: const BoxDecoration(
                                  //top border radius
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                height: 800,
                                // color: Colors.white,
                                child: Center(
                                  child: Column(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceAround,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 20),
                                        child: Text(
                                          'Category List',
                                          style: TextStyle(
                                            color: AppColors.mainBlackColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.purple[50]),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 40, right: 40),
                                                child: Text('Expense'),
                                              )),
                                          const SizedBox(width: 20),
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 40, right: 40),
                                                child: Text('Income'),
                                              )),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 40),
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: ShapeDecoration(
                                                  color:
                                                      const Color(0xFFFCEED3),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                  ),
                                                ),
                                                child: const Icon(
                                                  Icons.shopping_cart_sharp,
                                                  color: Color.fromARGB(
                                                      255, 131, 90, 9),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("Shopping",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .mainBlackColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.edit),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 40),
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: ShapeDecoration(
                                                  color: Colors.red[50],
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                  ),
                                                ),
                                                child: const Icon(
                                                  Icons.food_bank,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("Food",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .mainBlackColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.edit),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 40),
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: ShapeDecoration(
                                                  color: Colors.blue[50],
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                  ),
                                                ),
                                                child: const Icon(
                                                  Icons.directions_car,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("Transportation",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .mainBlackColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.edit),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.blueAccent),
                                          padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                horizontal: 60, vertical: 10),
                                          ),
                                        ),
                                        child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 60, right: 60),
                                            child: Text(
                                              "Add Category",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Category",
                                  style: TextStyle(color: AppColors.textColor),
                                ),
                                // const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(color: AppColors.textColor),
                              ),
                              // const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.keyboard_arrow_down),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tuesday, 12 May 2021",
                                style: TextStyle(color: AppColors.textColor),
                              ),
                              // const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.keyboard_arrow_down),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.attach_file_sharp),
                            ),
                            Text(
                              "Add attachment",
                              style: TextStyle(color: AppColors.textColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 10),
                          ),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.only(left: 60, right: 60),
                            child: Text(
                              "Continue",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      // const SizedBox(height: 60),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
