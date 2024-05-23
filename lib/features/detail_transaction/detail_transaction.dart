// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:login_signup_project/features/model/transaction_model.dart';
import '../../common/widgets/images/t_circular_images.dart';
import '../../core/app_routes.dart';
import '../../utils/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import '../../screens_home/home_expense_body.dart';
import 'package:intl/intl.dart';

import '../../utils/constants/image_strings.dart';
import '../../utils/shimmer/shimmer.dart';
import '../Controller/transaction_controller.dart';

class DetailTransaction extends StatefulWidget {
  final String transactionId;
  DetailTransaction({required this.transactionId});

  @override
  _DetailTransactionState createState() => _DetailTransactionState();
}

class _DetailTransactionState extends State<DetailTransaction> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();

  late bool _isIncome = false;

  @override
  void initState() {
    super.initState();
    _fetchTransactionData();
  }

  void _fetchTransactionData() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Income')
          .doc(widget.transactionId)
          .get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        amountController.text = data['amount'].toString() ?? '';
        categoryController.text = data['category'] ?? '';
        descriptionController.text = data['description'] ?? '';
        dateController.text = data['date'] ?? '';
        attachmentController.text = data['attachment'] ?? '';
        bool isIncome = data['isIncome'] ?? false;
        _updateIsIncome(isIncome);
      }
    } catch (error) {
      print('Error fetching transaction data: $error');
    }
  }


  void _updateIsIncome(bool isIncome) {
    if (_isIncome != isIncome) {
      setState(() {
        _isIncome = isIncome;
      });
    }
  }

  Color _getBackgroundColor() {
    if (_isIncome) {
      return Color.fromARGB(255, 10, 135, 15);
    } else {
      return Color.fromARGB(255, 155, 10, 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _getBackgroundColor(),
        appBar: AppBar(
          backgroundColor: _getBackgroundColor(),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Detail Transaction',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.delete, color: Colors.white),
              onPressed: () {
                _deleteTransactionAndNavigateHome(context);
              },
            ),
          ],
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 38.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 45,
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 90.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    _isIncome ? 'Income' : 'Expense',
                    style: TextStyle(
                      color: _getBackgroundColor(),
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: categoryController,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextField(
                          controller: descriptionController,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                dateController.text =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                              });
                            }
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: dateController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                hintText: 'Select Date',
                              ),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        SizedBox(height: 10),
                        Divider(),
                        GestureDetector(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Attachment',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: attachmentController.text.isNotEmpty
                                  ? (Uri.parse(attachmentController.text).isAbsolute
                                  ? Image.network(
                                attachmentController.text,
                                fit: BoxFit.cover,
                              )
                                  : Image.file(
                                File(attachmentController.text),
                                fit: BoxFit.cover,
                              ))
                                  : Image.asset('assets/images/attachment.png'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                width: 500,
                padding: EdgeInsets.all(15.0).copyWith(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    _updateTransaction(context, widget.transactionId);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future<void> _updateTransaction(
      BuildContext context, String transactionId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Income')
          .doc(transactionId)
          .update({
        'amount': int.parse(amountController.text),
        'category': categoryController.text,
        'description': descriptionController.text,
        'date': dateController.text,
      });
      //
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Transaction updated successfully'),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update transaction: $error'),
        ),
      );
    }
  }

  Future<void> _deleteTransactionAndNavigateHome(BuildContext context) async {
    bool confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this transaction?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );

    if (confirmDelete == true) {
      try {
        await FirebaseFirestore.instance
            .collection('Income')
            .doc(widget.transactionId)
            .delete();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Transaction deleted successfully'),
          ),
        );
        await Future.delayed(Duration(seconds: 1));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeBody()),
          (route) => false,
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete transaction: $error'),
          ),
        );
      }
    }
  }
}
