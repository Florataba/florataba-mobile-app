class OrderModel {
  final String status;
  final String orderDetails;
  final String orderInfo;
  final String totalPrice;
  final String locationId;

  OrderModel({
    required this.status,
    required this.orderDetails,
    required this.orderInfo,
    required this.totalPrice,
    required this.locationId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      status: json['status'],
      orderDetails: json['order_details'],
      orderInfo: json['order_info'],
      totalPrice: json['total_price'],
      locationId: json['address'],
    );
  }
}
