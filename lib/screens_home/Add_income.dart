import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_signup_project/Widget/bottom_sheet.dart';
import 'package:login_signup_project/common/widgets/images/t_circular_images.dart';
import 'package:login_signup_project/features/Controller/income_controller.dart';
import 'package:login_signup_project/features/model/income_model.dart';
import 'package:login_signup_project/utils/constants/image_strings.dart';
import 'package:login_signup_project/utils/shimmer/shimmer.dart';
import 'home_screen.dart';
import 'home_expense_body.dart';
import 'package:login_signup_project/utils/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class AddIncome extends StatefulWidget {
  const AddIncome({Key? key});

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  String selectedItem = 'Income';
  final IncomeController incomeController = Get.put(IncomeController());

  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  int ammount = 0;
  String category = '';
  String date = '';
  String description = '';
  File? attachment;
  bool isIncome = true;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        final formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
        date = formattedDate;
        dateController.text = date;
      });
      // Loại bỏ focus trên TextField sau khi chọn xong ngày
      FocusScope.of(context).unfocus();
    }
  }


  Future<void> _selectAttachment(BuildContext context) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    if (pickedFile.path != null && pickedFile.path.isNotEmpty) {
      setState(() {
        attachment = File(pickedFile.path);
      });
    } else {
      print("Invalid image path: ${pickedFile.path}");
    }
  } else {
    print("No image picked");
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: selectedItem == 'Income'
            ? const Color.fromARGB(255, 10, 135, 15)
            : const Color.fromARGB(255, 155, 10, 10),
        title: Center(
          child: DropdownButtonFormField<String>(
            dropdownColor: const Color.fromARGB(255, 98, 98, 98),
            value: 'Income',
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(35),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: selectedItem == 'Income'
                  ? Color.fromARGB(255, 10, 135, 15)
                  : Color.fromARGB(255, 155, 10, 10),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            items: const [
              DropdownMenuItem(
                value: 'Income',
                child: Text(
                  'Income',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              DropdownMenuItem(
                value: 'Expenses',
                child: Text(
                  'Expenses',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedItem = value!;
              });
            },
            onSaved: (value) {},
          ),
        ),
        actions: [
          Container(
            width: 60,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: selectedItem == 'Income'
                  ? const Color.fromARGB(255, 10, 135, 15)
                  : const Color.fromARGB(255, 155, 10, 10),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "How much?",
                        style: TextStyle(color: AppColors.textColor),
                      ),
                      GestureDetector(
                        onTap: () => _showAmountKeyboard(context),
                        child: TextField(
                          controller: amountController,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "\$0",
                            hintStyle: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 48,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              ammount = int.parse(value);
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Category',
                            hintStyle: TextStyle(color: AppColors.textColor),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          controller: categoryController,
                          onChanged: (value) {
                            setState(() {
                              category = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Description',
                            hintStyle: TextStyle(color: AppColors.textColor),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          controller: descriptionController,
                          onChanged: (value) {
                            setState(() {
                              description = value;
                            });
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Date',
                              hintStyle: TextStyle(color: AppColors.textColor),
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            controller: dateController,
                            onTap: () => _selectDate(context),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _selectAttachment(context),
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: SizedBox( 
                          height: 60, 
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  attachment == null ? 'Attachment' : 'Image Selected',
                                  style: const TextStyle(color: AppColors.textColor),
                                ),
                                Icon(Icons.attach_file, color: AppColors.textColor),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),


                   Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 50),
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () {
                          if (amountController.text.isNotEmpty && category.isNotEmpty && date.isNotEmpty && description.isNotEmpty) {
                            final IncomeModel income = IncomeModel(
                              ammount: ammount, // Sử dụng amountController.text thay vì amount
                              category: category,
                              description: description,
                              date: date,
                              attachment: attachment != null ? attachment!.path : null, // Sử dụng attachment?.path thay vì attachment
                              isIncome : selectedItem == 'Income' ? true : false,
                              // transactionType: selectedItem,
                            );

                            //add the income to the database
                            incomeController.addIncome(income);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => HomeBody()),
                              (route) => false,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please fill all the fields!')),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: selectedItem == 'Income' ? const Color.fromARGB(255, 10, 135, 15) : const Color.fromARGB(255, 155, 10, 10),
                          padding: const EdgeInsets.all(16.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }

  // Method to show number keyboard
  void _showAmountKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
    // FocusScope.of(context).requestFocus(FocusNode());
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 250,
          child: Column(
            children: [
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(initialItem: ammount),
                  itemExtent: 50,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      ammount = index;
                      amountController.text = index.toString();
                    });
                  },
                  children: List.generate(
                    1000,
                    (index) => Center(
                      child: Text(
                        index.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
