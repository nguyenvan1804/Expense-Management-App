import 'package:cloud_firestore/cloud_firestore.dart';

class IncomeModel {
  String? id;
  int? ammount;
  String? category;
  String? description;
  String? date;
  String? attachment;

  IncomeModel(
      {this.id,
      this.ammount,
      this.category,
      this.description,
      this.date,
      this.attachment});

  static IncomeModel empty() {
    return IncomeModel(
      id: '',
      ammount: 0,
      category: '',
      description: '',
      date: '',
      attachment: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ammount': ammount,
      'category': category,
      'description': description,
      'date': date,
      'attachment': attachment,
    };
  }

  factory IncomeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return IncomeModel(
        id: document.id,
        ammount: data['ammount'] ?? 0,
        category: data['category'] ?? '',
        description: data['description'] ?? '',
        date: data['date'] ?? '',
        attachment: data['attachment'] ?? '',
      );
    } else {
      return IncomeModel.empty();
    }
  }
}
