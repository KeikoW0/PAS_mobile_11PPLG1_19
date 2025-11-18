import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_19/controllers/bottomnav_controller.dart';
import 'package:pas_mobile_11pplg1_19/pages/favorite_page.dart';
import 'package:pas_mobile_11pplg1_19/pages/products_page.dart';
import 'package:pas_mobile_11pplg1_19/pages/profile_page.dart';

class BottomNavExample extends StatelessWidget {
  final BottomnavController controller = Get.put(BottomnavController());

  final List<Widget> pages = [ProductsPage(), FavoritePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: "Products",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
