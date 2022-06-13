import 'dart:convert';

import 'package:florataba_mobile_app/api/credentials.dart';
import 'package:florataba_mobile_app/api/orders/order_model.dart';
import 'package:http/http.dart' as http;

class OrderApi {
  Future<String> createLocation(Map<String, String> data) async {
    http.Response location = await http.post(
      Uri.parse('http://$API_SERVER_IP:8000/api/location/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'street': data["street"] as String,
        'region': data["region"] as String,
        'build_number': data["build_number"] as String,
        'apartment_number': data["apartment_number"] as String,
      }),
    );
    print(location.body);
    return jsonDecode(location.body)['id'];
  }

  Future<String> createOrderDetails(Map<String, String> data) async {
    String addressId = await createLocation(data);
    print(addressId);
    http.Response orderDetails = await http.post(
      Uri.parse('http://$API_SERVER_IP:8000/api/order-details/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'total_price': data["total_price"] as String,
        'order_info': data["order_info"] as String,
        'address_id': addressId,
      }),
    );
    print(orderDetails.body);
    return jsonDecode(orderDetails.body)['id'];
  }

  Future createOrder(Map<String, String> data) async {
    String orderDetails = await createOrderDetails(data);
    http.Response order = await http.post(
      Uri.parse('http://$API_SERVER_IP:8000/api/order/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'status': data["total_price"] as String,
        'order_details_id': orderDetails,
      }),
    );
    print(order.body);
    return OrderModel.fromJson(jsonDecode(order.body));
  }
}
