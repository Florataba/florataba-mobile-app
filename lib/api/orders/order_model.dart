class OrderModel {
  final String status;
  final String orderDetails;

  OrderModel({
    required this.status,
    required this.orderDetails,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      status: json['status'],
      orderDetails: json['order_details'],
    );
  }
}

class OrderDetails {
  final String orderInfo;
  final String totalPrice;
  final String locationId;

  OrderDetails({
    required this.orderInfo,
    required this.totalPrice,
    required this.locationId,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      orderInfo: json['order_info'],
      totalPrice: json['total_price'],
      locationId: json['address'],
    );
  }
}
