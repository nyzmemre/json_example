import 'dart:convert';

import 'package:json_example/models/models.dart';
import 'package:http/http.dart' as http;

class GetApi {
  Future<Models> getModelsData() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
      return Models.fromJson(json.decode(response.body));
    } else
      throw Exception("Hata Oluştu");
  }

}