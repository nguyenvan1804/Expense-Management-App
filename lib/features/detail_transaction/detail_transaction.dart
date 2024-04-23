// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../core/app_routes.dart';
import '../../utils/constants/constants.dart';

class DetailTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.incomeColor,
      appBar: AppBar(
        backgroundColor: appColor.incomeColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
          onPressed: () {
            // Navigator.pop(context);
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
              // Navigator.pop(context);
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            SizedBox(
              height: 30.0,
            ),

            Text(
              '+200.000',
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
                  'Expense',
                  style: TextStyle(
                    color: appColor.incomeColor,
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                  ),
                  
                ),
              ),
            ),

            Expanded(
              child: 
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),
                ),  
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(25.0).copyWith(left: 30.0),
                  child: Column(
                    
                    children:[
                      
                      Row(
                        children: [
                          Container(
                            width: 120,
                            child:Column(  
                              crossAxisAlignment: CrossAxisAlignment.start,                          
                              children: [
                                Text(
                                  'Category',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                              child: Text(
                                'Salary',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),                          
                          ),
                        ],
                      ),
       
                      SizedBox(height: 10),

                      Row(
                        children: [
                          Container(
                            width: 120,
                            child:Column(  
                              crossAxisAlignment: CrossAxisAlignment.start,                          
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                              child: Text(
                                'Salary of April',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),                          
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          Container(
                            width: 120,
                            child:Column(  
                              crossAxisAlignment: CrossAxisAlignment.start,                          
                              children: [
                                Text(
                                  'Date',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                              child: Text(
                                '10/04/2024',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),                          
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          Container(
                            width: 120,
                            child:Column(  
                              crossAxisAlignment: CrossAxisAlignment.start,                          
                              children: [
                                Text(
                                  'Time',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                              child: Text(
                                '12:00',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),                          
                          ),
                        ],
                      ),

                      SizedBox(height: 10),
                      Divider(),

                      Row(
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

                      SizedBox(height: 10),

                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,                          
                          children: [
                            Expanded(
                              child: 
                                Image.asset('assets/images/attachment.png'),
                              )
                          ],
                        ),

                    ]
                  ),
                ),
              ),
            ),

            Container(
              color: Colors.white,
              width: 500,
              padding: EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  // code to execute when the button is pressed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // set the button shape to a circle
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
      ),
    );
  }
}
