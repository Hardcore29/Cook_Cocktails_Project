import 'dart:convert';
import 'package:drink_app/models/cocktail_model.dart';
import 'package:http/http.dart' as http;
import 'package:drink_app/views/home.dart';

class CocktailAPI {
  static Future<List<Drinks>> fetchDrinks(String query) async {
    final url = Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$query");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> drinks = data['drinks'];

      return drinks.map((json) => Drinks.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cocktails');
    }
  }
}
