import 'dart:convert';

import 'package:collection/collection.dart';
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
        'status': data["status"] as String,
        'order_details_id': orderDetails,
      }),
    );
    print(order.body);
    return order.statusCode;
  }

  Future<List<OrderModel>> getOrderList() async {
    try {
      List<Map<String, dynamic>> dataList = [];
      var response =
          await http.get(Uri.parse('http://$API_SERVER_IP:8000/api/order/'));
      var responseDetails = await http
          .get(Uri.parse('http://$API_SERVER_IP:8000/api/order-details/'));
      final dataCollection = json.decode(utf8.decode(response.bodyBytes));
      final dataDetailsCollection =
          json.decode(utf8.decode(responseDetails.bodyBytes));
      (dataCollection as List).forEach((element) {
        var result = CombinedMapView([
          element as Map<String, dynamic>,
          (dataDetailsCollection as List).firstWhere((elementDetails) =>
                  elementDetails["id"] == element['order_details'])
              as Map<String, dynamic>
        ]);

        dataList.add(result);
      });
print(dataList.length);
List<OrderModel> r=dataList.map((json) => OrderModel.fromJson(json)).toList();
      print(r.length);
      return r;
    } catch (error) {
      return [];
    }
  }
}
