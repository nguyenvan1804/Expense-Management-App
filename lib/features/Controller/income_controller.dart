import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup_project/data/repositories/income_repository.dart';
import 'package:login_signup_project/features/model/income_model.dart';
import 'package:login_signup_project/utils/popups/loaders.dart';

class IncomeController extends GetxController {
  static IncomeController get instance => Get.find();

  final isLoading = false.obs;
  final imageUploading = false.obs;

  String attachment = '';

  final _incomeRepositoy = Get.put(IncomeRepoitory());

  RxList<IncomeModel> incomeList = <IncomeModel>[].obs;
  Rx<IncomeModel> income = IncomeModel.empty().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchIncome();
    super.onInit();
  }

  Future<void> fetchIncome() async {
    try {
      isLoading.value = true;

      final income = await _incomeRepositoy.getAllIncome();

      //update the income list
      incomeList.assignAll(income);

      // filter the income list
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addIncome(IncomeModel income) async {
    try {
      isLoading.value = true;

      await _incomeRepositoy.addIncome(income);

      fetchIncome();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}
