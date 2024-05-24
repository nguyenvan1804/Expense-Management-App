import 'dart:ffi';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:login_signup_project/Widget/bottom_sheet.dart';
import 'package:login_signup_project/common/widgets/images/t_circular_images.dart';
import 'package:login_signup_project/data/repositories/transaction_repository.dart';
import 'package:login_signup_project/features/Controller/transaction_controller.dart';
import 'package:login_signup_project/features/model/transaction_model.dart';
import 'package:login_signup_project/screens_home/home_expense_body.dart';
import 'package:login_signup_project/utils/constants/image_strings.dart';
import 'package:login_signup_project/utils/shimmer/shimmer.dart';
import 'home_screen.dart';
import 'package:login_signup_project/utils/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/widgets/images/t_circular_images.dart';
import '../features/personalization/user_controller.dart';
import '../utils/constants/image_strings.dart';
import '../utils/shimmer/shimmer.dart';

class AddInconme extends StatefulWidget {
  const AddInconme({super.key});

  @override
  State<AddInconme> createState() => _AddInconmeState();
}

class _AddInconmeState extends State<AddInconme> {

  String selectedItem = 'Income';
  final IncomeController incomeController = Get.put(IncomeController());
  final UserController _userController = UserController.instance;

  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  
  int amount = 0;
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

  final transactionRepository = Get.put(TransactionRepository());
  Rx<TransactionModel> transaction = TransactionModel.empty().obs;

  Future<void> _selectAttachment(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (pickedFile.path != null && pickedFile.path.isNotEmpty) {
        setState(() {
          attachment = File(pickedFile.path);
        });
        final imageUrl = await transactionRepository.uploadAttachment('Attachmentt/Images', pickedFile);

        // Update User Image Record
        Map<String, dynamic> json = {'attachment': imageUrl};
        await transactionRepository.updateSingleField(json);
        transaction.value.attachment = imageUrl;
        transaction.refresh();

      } else {
        print("Invalid image path: ${pickedFile.path}");
      }
    } else {
      print("No image picked");
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        backgroundColor: selectedItem == 'Income'
            ? Color.fromARGB(255, 10, 135, 15)
            : Color.fromARGB(255, 155, 10, 10),
        title: Center(
          child: DropdownButtonFormField<String>(
            dropdownColor: Color.fromARGB(255, 98, 98, 98),
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
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            items: [
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
                  ? Color.fromARGB(255, 10, 135, 15)
                  : Color.fromARGB(255, 155, 10, 10),
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
                      GestureDetector(
                        onTap: () {
                          _showAmountKeyboard(context);
                        },
                        child: TextField(
                          controller: amountController,

                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "\$0",
                            hintStyle: TextStyle(
                                color: AppColors.textColor, fontSize: 48),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                          ),
                          keyboardType: TextInputType.number,
                          // Add any additional TextField properties as needed
                          onChanged: (value) {
                            setState(() {
                              amount = int.parse(value);
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
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Category',
                                  hintStyle:
                                      TextStyle(color: AppColors.textColor),
                                ),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                // Add any additional TextField properties as needed
                                controller: categoryController,
                                onChanged: (value) {
                                  setState(() {
                                    category = categoryController.text;
                                  });
                                },
                              ),
                            ),
                          ],
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
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Description',
                                  hintStyle:
                                      TextStyle(color: AppColors.textColor),
                                ),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                // Add any additional TextField properties as needed
                                controller: descriptionController,
                                onChanged: (value) {
                                  setState(() {
                                    description = descriptionController.text;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.all(20),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     border: Border.all(color: Colors.grey.shade300),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 0, right: 0),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Expanded(
                    //           child: TextField(
                    //             decoration: InputDecoration(
                    //               enabledBorder: const OutlineInputBorder(
                    //                 borderSide: BorderSide.none,
                    //               ),
                    //               focusedBorder: const OutlineInputBorder(
                    //                 borderSide: BorderSide.none,
                    //               ),
                    //               hintText: '12 May 2021',
                    //               hintStyle:
                    //                   TextStyle(color: AppColors.textColor),
                    //             ),
                    //             style: const TextStyle(
                    //               color: Colors.black,
                    //             ),
                    //             // Add any additional TextField properties as needed
                    //             controller: dateController,
                    //             onChanged: (value) {
                    //               setState(() {
                    //                 date = dateController.text;
                    //               });
                    //             },
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Date',
                                hintStyle:
                                    TextStyle(color: AppColors.textColor),
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              controller: dateController,
                              onTap: () => _selectDate(context),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
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
                                  attachment == null
                                      ? 'Attachment'
                                      : 'Image Selected',
                                  style: TextStyle(color: AppColors.textColor),
                                ),
                                Icon(Icons.attach_file,
                                    color: AppColors.textColor),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    attachment != null
                      ? Container(
                        constraints: const BoxConstraints(
                          maxWidth: 500.0, // Đặt giới hạn chiều rộng tối đa
                          maxHeight: 500.0, // Đặt giới hạn chiều cao tối đa
                        ),
                        child: Image.file(
                          attachment!,
                          fit: BoxFit.contain, // Điều chỉnh hình ảnh để nằm gọn trong Container
                        ),
                      )
                        : const Text('Please select bill image'),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        final userId = _userController.user.value.id;
                        // Kiểm tra xem có ID của người dùng hay không trước khi lưu giao dịch
                        if (userId.isNotEmpty) {
                          //map dữ liệu vào model giao dịch
                          if (selectedItem == 'Income') {
                            isIncome = true;
                          } else {
                            isIncome = false;
                          }
                        }
                        //map the data to the model
                        if (selectedItem == 'Income') {
                          isIncome = true;
                        } else {
                          isIncome = false;
                        }
                        final income = TransactionModel(
                          userId: userId,
                          amount: amount,
                          category: category ?? '',
                          date: date ?? '',
                          description: description ?? '',
                          attachment: attachment?.path,
                          isIncome: isIncome,
                        );

                        //add the income to the database
                        incomeController.addIncome(income);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeBody(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          selectedItem == 'Income'
                              ? Color.fromARGB(255, 10, 135, 15)
                              : Color.fromARGB(255, 155, 10, 10),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 10),
                        ),
                      ),
                      child: const Padding(
                          padding: EdgeInsets.only(left: 60, right: 60),
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
            // ),
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
                  scrollController:
                      FixedExtentScrollController(initialItem: amount),
                  itemExtent: 50,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      amount = index;
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
