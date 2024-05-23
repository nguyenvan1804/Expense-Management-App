import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  String? id;
  int? amount;
  String? category;
  String? description;
  String? date;
  String? attachment;
  bool? isIncome;

  TransactionModel(
      {this.id,
      this.amount,
      this.category,
      this.description,
      this.date,
      this.attachment,
      this.isIncome});

  static TransactionModel empty() {
    return TransactionModel(
        id: '',
        amount: 0,
        category: '',
        description: '',
        date: '',
        attachment: '',
        isIncome: true);
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'category': category,
      'description': description,
      'date': date,
      'attachment': attachment,
      'isIncome': isIncome
    };
  }

  factory TransactionModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return TransactionModel(
          id: document.id,
          amount: data['amount'] ?? 0,
          category: data['category'] ?? '',
          description: data['description'] ?? '',
          date: data['date'] ?? '',
          attachment: data['attachment'] ?? '',
          isIncome: data['isIncome'] ?? false);
    } else {
      return TransactionModel.empty();
    }
  }
}
