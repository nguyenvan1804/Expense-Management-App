import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup_project/data/repositories/authentication_repository.dart';
import 'package:login_signup_project/data/repositories/transaction_repository.dart';
import 'package:login_signup_project/features/model/transaction_model.dart';
import 'package:login_signup_project/utils/popups/loaders.dart';
import 'package:login_signup_project/features/personalization/user_controller.dart';

class IncomeController extends GetxController {
  static IncomeController get instance => Get.find();

  final isLoading = false.obs;
  final imageUploading = false.obs;

  // int incomeAmount = 0;
  // int expenseAmount = 0;

  int totalIncomePerMonth = 0;

  String attachment = '';

  final _transactionRepository = Get.put(TransactionRepository());

  RxList<TransactionModel> allTransaction = <TransactionModel>[].obs;
  RxList<TransactionModel> incomeList = <TransactionModel>[].obs;
  RxList<TransactionModel> expenseList = <TransactionModel>[].obs;
  Rx<TransactionModel> income = TransactionModel.empty().obs;
  // final userController = Get.find<UserController>();
  // final userController = Get.put(UserController());

  @override
  void onInit() {
    // TODO: implement onInit
    fetchIncome();
    super.onInit();
  }

  Future<void> fetchIncome() async {
    try {
      isLoading.value = true;

      // final alltrasaction = await _transactionRepository.getAllIncome();

      final userId = AuthenticationRepository.instance.authUser?.uid;
      print('User ID: $userId');

      final alltrasaction = await _transactionRepository.getAllIncome(userId!);
      // [ ]
      //query all transaction in time created order
      print(alltrasaction);
      allTransaction.assignAll(alltrasaction);

      //update the income list
      incomeList.assignAll(alltrasaction
          .where((transaction) => transaction.isIncome == true)
          .toList());

      // incomeList.forEach((element) {
      //   incomeAmount += element.amount!;
      // });
      // filter the expense list
      expenseList.assignAll(alltrasaction
          .where((transaction) => transaction.isIncome == false)
          .toList());

      // expenseList.forEach((element) {
      //   expenseAmount += element.amount!;
      // });
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addIncome(TransactionModel income) async {
    try {
      isLoading.value = true;

      await _transactionRepository.addIncome(income);

      fetchIncome();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  uploadAttachment() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // Upload Image
        final imageUrl = await _transactionRepository.uploadAttachment(
            'Attachmentt/Images', image);

        // Update User Image Record
        Map<String, dynamic> json = {'attachment': imageUrl};
        await _transactionRepository.updateSingleField(json);
        income.value.attachment = imageUrl;
        income.refresh();
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'OhSnap', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }

  // calculate total income per month
  int calculateTotalIncomePerMonth() {
    final now = DateTime.now();

    //get all the month in income["date"]
    List incomeDate = incomeList.map((e) => e.date).toList();

    for (int i = 0; i < incomeDate.length; i++) {
      if (int.parse(incomeDate[i].split('/')[1]) == now.month) {
        totalIncomePerMonth += incomeList[i].amount!;
      }
    }
    print(totalIncomePerMonth);
    return totalIncomePerMonth;
  }

  //fliter income
}
