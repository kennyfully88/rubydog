import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kondate_app/configs/constants.dart';
import 'package:kondate_app/models/ingredient.dart';

// ApiGatewayから材料を取得
Future<Map<num, Ingredient>> getIngredientFromApi() async {
  final response = await http.get(Uri.parse('$apiRoute/ingredients'));
  Map<num, Ingredient> ingredientMap = {};

  if (response.statusCode == 200) {
    // jsonデータをパース
    final List jsonData =
        json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    for (final item in jsonData) {
      ingredientMap[item['id']] = Ingredient.fromJson(item);
    }
    debugPrint('getIngredientFromApiループ後:${ingredientMap[1701579808]!.name}');

    return ingredientMap;
  } else {
    throw Exception('Failed to load ingredient');
  }
}

Future<void> postIngredientToApi(Map map) async {
  final response = await http.post(Uri.parse(apiRoute), body: json.encode(Map));
  if (response.statusCode == 200) {
    debugPrint(response.body);
  } else {
    throw Exception('Failed to post ingredient');
  }
}

Future<void> putIngredientToApi(int id, Map map) async {
  final response = await http.put(Uri.parse('$apiRoute/ingredients/$id'),
      body: json.encode(Map));
  if (response.statusCode == 200) {
    debugPrint(response.body);
  } else {
    throw Exception('Failed to put ingredient');
  }
}

Future<void> deleteIngredientToApi(int id) async {
  final response = await http.delete(Uri.parse('$apiRoute/ingredients/$id'));
  if (response.statusCode == 200) {
    debugPrint(response.body);
  } else {
    throw Exception('Failed to delete ingredient');
  }
}

// PokeAPIから材料を取得
/*
Future<Ingredient> getIngredientFromApi(int id) async {
  final response = await http.get(Uri.parse('$apiRoute/pokemon/$id')); // PokeAPI
  if (response.statusCode == 200) {
    debugPrint(response.body);
    return Ingredient.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load ingredient');
  }
}
*/
