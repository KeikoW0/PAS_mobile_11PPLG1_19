import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_19/db_helper.dart';
import 'package:pas_mobile_11pplg1_19/models/products_model.dart';

class ProductsController {
  Future<List<ProductsModel>> loadData() async {
    List<ProductsModel> localData = await DatabaseHelper.instance
        .readAllCategories();

    if (localData.isEmpty) {
      try {
        final response = await http.get(
          Uri.parse('https://fakestoreapi.com/products'),
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final List<dynamic> jsonList = data['categories'];

          List<ProductsModel> apiCategories = jsonList
              .map((json) => ProductsModel.fromJson(json))
              .toList();

          await DatabaseHelper.instance.insertBatch(apiCategories);

          localData = await DatabaseHelper.instance.readAllCategories();
        }
      } catch (e) {
        throw Exception("Error fetching API: $e");
      }
    }

    return localData;
  }
}
