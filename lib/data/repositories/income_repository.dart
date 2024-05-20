import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup_project/utils/exceptions/platform_exception.dart';

import '../../features/model/income_model.dart';
import '../../utils/exceptions/firebase_exception.dart';
import '../../utils/exceptions/format_exception.dart';

class IncomeRepoitory extends GetxController {
  static IncomeRepoitory get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //get all income
  Future<List<IncomeModel>> getAllIncome() async {
    try {
      final snapshot = await _db.collection('Income').get();
      final list =
          snapshot.docs.map((doc) => IncomeModel.fromSnapshot(doc)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //add income
  Future<void> addIncome(IncomeModel income) async {
    try {
      await _db.collection('Income').add(income.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  uploadAttachment(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
 
}
