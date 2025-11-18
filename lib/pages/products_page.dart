import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_19/controllers/products_controller.dart';

class ProductsPage extends StatelessWidget {
  final controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.products.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView.builder(
        itemCount: controller.products.length,
        itemBuilder: (context, i) {
          final item = controller.products[i];

          return FutureBuilder<bool>(
            future: controller.isFavorite(item.id),
            builder: (_, snapshot) {
              bool isFav = snapshot.data ?? false;

              return Card(
                child: ListTile(
                  leading: Image.network(item.image, width: 50),
                  title: Text(item.title),
                  subtitle: Text(item.description, maxLines: 2),
                  trailing: IconButton(
                    icon: Icon(
                      isFav ? Icons.bookmark : Icons.bookmark_border,
                      color: isFav ? Colors.orange : Colors.grey,
                    ),
                    onPressed: () => controller.toggleFavorite(item),
                  ),
                ),
              );
            },
          );
        },
      );
    });
  }
}
