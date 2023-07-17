import 'dart:convert';
import 'data.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<List<Data>> fetchData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Data.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }
}
