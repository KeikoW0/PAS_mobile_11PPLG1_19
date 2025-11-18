import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_19/db_helper.dart';
import 'package:pas_mobile_11pplg1_19/models/products_model.dart';

class ProductsController extends GetxController {
  RxList<ProductsModel> products = <ProductsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    List<ProductsModel> localData = await DatabaseHelper.instance.readAll();

    if (localData.isEmpty) {
      try {
        final response = await http.get(
          Uri.parse("https://fakestoreapi.com/products"),
        );

        if (response.statusCode == 200) {
          final List<dynamic> jsonList = json.decode(response.body);

          List<ProductsModel> apiData = jsonList
              .map((e) => ProductsModel.fromJson(e))
              .toList();

          await DatabaseHelper.instance.insertBatch(apiData);

          localData = await DatabaseHelper.instance.readAll();
        }
      } catch (e) {
        print("ERROR API: $e");
      }
    }

    products.value = localData;
  }
}
