// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CardItemModel {
  String cardItem;
  double itemQuantity;
  double itemTotalCost;
  double itemPercent;
  double itemCost;
  double itemChangePercentage;
  CardItemModel({
    required this.cardItem,
    required this.itemQuantity,
    required this.itemTotalCost,
    required this.itemPercent,
    required this.itemCost,
    required this.itemChangePercentage,
  });

  factory CardItemModel.fromMap(Map<String, dynamic> map) {
    return CardItemModel(
      cardItem: map['cardItemTitle'] as String,
      itemQuantity: map['itemQuantity'] as double,
      itemTotalCost: map['itemTotalCost'] as double,
      itemPercent: map['itemPercent'] as double,
      itemCost: map['itemCost'] as double,
      itemChangePercentage: map['itemChangePercentage'] as double,
    );
  }

  factory CardItemModel.fromJson(String source) =>
      CardItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
