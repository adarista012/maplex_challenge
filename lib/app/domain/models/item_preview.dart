class ItemPreview {
  final String? title;
  final double? price;
  final String? id;
  final String? thumbnailUrl;

  ItemPreview({
    required this.title,
    required this.id,
    required this.price,
    required this.thumbnailUrl,
  });

  factory ItemPreview.fromJson(dynamic json) {
    return ItemPreview(
      title: json['title'],
      price: double.parse(json['price'].toString()),
      id: json['id'],
      thumbnailUrl: json['thumbnail'],
    );
  }
}

List<ItemPreview>? listItemPreviewFromJson(Map<String, dynamic> json) {
  List<dynamic> l = [];
  l = json['results'];
  return l.map((e) => ItemPreview.fromJson(e)).toList();
}
