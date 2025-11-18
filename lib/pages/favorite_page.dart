import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_19/controllers/products_controller.dart';

class FavoritePage extends StatelessWidget {
  final controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.favorites.isEmpty) {
        return const Center(child: Text("Belum ada bookmark"));
      }

      return ListView.builder(
        itemCount: controller.favorites.length,
        itemBuilder: (context, i) {
          final item = controller.favorites[i];

          return Card(
            child: ListTile(
              leading: Image.network(item.image, width: 50),
              title: Text(item.title),
              subtitle: Text(item.description, maxLines: 2),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.toggleFavorite(item),
              ),
            ),
          );
        },
      );
    });
  }
}
