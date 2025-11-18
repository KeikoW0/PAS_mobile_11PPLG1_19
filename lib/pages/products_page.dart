import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg1_19/models/products_model.dart';

class ProductsPage extends StatelessWidget {
  final List<ProductsModel> categories;

  const ProductsPage({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final item = categories[index];
        return GestureDetector(
          child: Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(
                item.image,
                width: 50,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_not_supported),
              ),
              title: Text(
                item.price.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                item.price.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                item.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }
}
