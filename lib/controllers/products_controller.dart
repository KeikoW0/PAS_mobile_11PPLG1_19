import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_19/db_helper.dart';
import 'package:pas_mobile_11pplg1_19/models/products_model.dart';

class ProductsController extends GetxController {
  RxList<ProductsModel> products = <ProductsModel>[].obs;
  RxList<ProductsModel> favorites = <ProductsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
    loadFavorites();
  }

  Future<void> loadData() async {
    List<ProductsModel> localData = await DatabaseHelper.instance
        .readAllProducts();

    if (localData.isEmpty) {
      try {
        final response = await http.get(
          Uri.parse("https://fakestoreapi.com/products"),
        );

        if (response.statusCode == 200) {
          final List jsonData = json.decode(response.body);

          List<ProductsModel> apiData = jsonData
              .map((e) => ProductsModel.fromJson(e))
              .toList();

          await DatabaseHelper.instance.insertBatch(apiData);

          localData = await DatabaseHelper.instance.readAllProducts();
        }
      } catch (e) {
        print("ERROR API: $e");
      }
    }

    products.value = localData;
  }

  Future<void> loadFavorites() async {
    favorites.value = await DatabaseHelper.instance.readFavorites();
  }

  Future<void> toggleFavorite(ProductsModel p) async {
    bool exist = await DatabaseHelper.instance.isFavorite(p.id);

    if (exist) {
      await DatabaseHelper.instance.removeFavorite(p.id);
    } else {
      await DatabaseHelper.instance.addToFavorite(p);
    }

    loadFavorites();
  }

  Future<bool> isFavorite(int id) async {
    return await DatabaseHelper.instance.isFavorite(id);
  }
}
