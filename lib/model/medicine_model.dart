// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Medicine {
  String scientific_name;
  String trade_name;
  String manufacture_company;
  String date;
  String category_id;
  String id;
  int available_quantity;
  String price;
  bool isFavorite;
  Medicine(
      {required this.id,
      required this.scientific_name,
      required this.trade_name,
      required this.manufacture_company,
      required this.date,
      required this.category_id,
      required this.available_quantity,
      required this.price,
      this.isFavorite = false});

  Medicine copyWith({
    String? scientific_name,
    String? trade_name,
    String? manufacture_company,
    String? date,
    String? category_id,
    int? available_quantity,
    String? price,
    String? id,
  }) {
    return Medicine(
      scientific_name: scientific_name ?? this.scientific_name,
      trade_name: trade_name ?? this.trade_name,
      manufacture_company: manufacture_company ?? this.manufacture_company,
      date: date ?? this.date,
      category_id: category_id ?? this.category_id,
      available_quantity: available_quantity ?? this.available_quantity,
      price: price ?? this.price,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'scientific_name': scientific_name,
      'trade_name': trade_name,
      'manufacture_company': manufacture_company,
      'date': date,
      'category_id': category_id,
      'available_quantity': available_quantity,
      'price': price,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      scientific_name: map['scientific_name'].toString(),
      trade_name: map['trade_name'].toString(),
      manufacture_company: map['manufacture_company'].toString(),
      date: map['expiry_date'].toString(),
      category_id: map['category_id'].toString(),
      available_quantity: map['available_quantity'],
      price: map['price'].toString(),
      id: map['id'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Medicine.fromJson(String source) =>
      Medicine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Medicine(scientific_name: $scientific_name, trade_name: $trade_name, manufacture_company: $manufacture_company, date: $date, category_id: $category_id, available_quantity: $available_quantity, price: $price)';
  }

  @override
  bool operator ==(covariant Medicine other) {
    if (identical(this, other)) return true;

    return other.scientific_name == scientific_name &&
        other.trade_name == trade_name &&
        other.manufacture_company == manufacture_company &&
        other.date == date &&
        other.category_id == category_id &&
        other.available_quantity == available_quantity &&
        other.price == price;
  }

  @override
  int get hashCode {
    return scientific_name.hashCode ^
        trade_name.hashCode ^
        manufacture_company.hashCode ^
        date.hashCode ^
        category_id.hashCode ^
        available_quantity.hashCode ^
        price.hashCode;
  }
}
