import 'dart:convert';

import 'package:florataba_mobile_app/api/catalog/catalog_model.dart';
import 'package:http/http.dart' as http;

import '../credentials.dart';

class CatalogApi {
  Future<List<BouquetModel>> getCatalogList() async {
    try {
      var response =
          await http.get(Uri.parse('http://$API_SERVER_IP:8000/bouquetes/'));
      final dataCollection = json.decode(utf8.decode(response.bodyBytes));

      return (dataCollection as List)
          .map((json) => BouquetModel.fromJson(json))
          .toList();
    } catch (error) {
      return [];
    }
  }
}
