class BouquetModel {
  final String title;
  final String eventType;
  final String description;
  final double price;
  final bool isSingleBouquet;
  final int availableQuantity;
  final String imgUrl;

  BouquetModel({
    required this.title,
    required this.eventType,
    required this.description,
    required this.price,
    required this.isSingleBouquet,
    required this.availableQuantity,
    required this.imgUrl,
  });

  factory BouquetModel.fromJson(Map<String, dynamic> json) {
    return BouquetModel(
      title: json['title'],
      eventType: json['event_type_bouquet'],
      description: json['description'],
      price: json['price'],
      isSingleBouquet: json['is_single_bouquet'],
      availableQuantity: json['available_quantity'],
      imgUrl: json['img_url'],
    );
  }
}
