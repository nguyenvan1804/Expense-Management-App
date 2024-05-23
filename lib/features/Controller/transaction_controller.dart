import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup_project/data/repositories/transaction_repository.dart';
import 'package:login_signup_project/features/model/transaction_model.dart';
import 'package:login_signup_project/utils/popups/loaders.dart';

class IncomeController extends GetxController {
  static IncomeController get instance => Get.find();

  final isLoading = false.obs;
  final imageUploading = false.obs;

  String attachment = '';

  final _transactionRepository = Get.put(TransactionRepository());

  RxList<TransactionModel> allTransaction = <TransactionModel>[].obs;
  RxList<TransactionModel> incomeList = <TransactionModel>[].obs;
  RxList<TransactionModel> expenseList = <TransactionModel>[].obs;
  Rx<TransactionModel> income = TransactionModel.empty().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchIncome();
    super.onInit();
  }

  Future<void> fetchIncome() async {
    try {
      isLoading.value = true;

      final alltrasaction = await _transactionRepository.getAllIncome();

      //query all transaction in time created order
      allTransaction.assignAll(alltrasaction);
      //update the income list
      incomeList.assignAll(alltrasaction
          .where((transaction) => transaction.isIncome == true)
          .toList());

      // filter the expense list
      expenseList.assignAll(alltrasaction
          .where((transaction) => transaction.isIncome == false)
          .toList());
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
        // imageUploading.value = true;
        // Upload Image
        final imageUrl = await _transactionRepository.uploadAttachment(
            'Users/Images/Profile/', image);

        print('Image Url: $imageUrl');
        // mappping the attachment
        Map<String, dynamic> json = {'attachment': imageUrl};
        print(json);
        return json;
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'OhSnap', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }

  //fliter income
}