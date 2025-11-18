import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_19/controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductsController());
  }
}
