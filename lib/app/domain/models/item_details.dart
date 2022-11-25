class ItemDetails {
  String? condition;
  int? availableQuantity;
  List<String>? pictures;

  ItemDetails({
    required this.condition,
    required this.availableQuantity,
    required this.pictures,
  });

  factory ItemDetails.fromJson(Map<String, dynamic> json) {
    return ItemDetails(
        condition: json['condition'],
        availableQuantity: json['available_quantity'],
        pictures: picturesFromJson(json['pictures']));
  }
}

List<String>? picturesFromJson(List<dynamic> list) {
  return list.map((e) => e['url'].toString()).toList();
}
