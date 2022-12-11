import 'package:first_getx_app/controller/cart_controller.dart';
import 'package:first_getx_app/controller/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.products[index].productName,
                                        style: const TextStyle(
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(controller
                                          .products[index].productDescription),
                                    ],
                                  ),
                                  Text(
                                    '\$${controller.products[index].price}',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                child: const Text('Add to Cart'),
                              ),
                              Obx(
                                () => IconButton(
                                  onPressed: () {
                                    controller.products[index].isFavourite
                                        .toggle();
                                  },
                                  icon: controller
                                          .products[index].isFavourite.value
                                      ? const Icon(Icons.check_box_rounded)
                                      : const Icon(Icons
                                          .check_box_outline_blank_outlined),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GetX<CartController>(
              builder: (controller) {
                return Text(
                  'Total amount: \$ ${controller.toalPrice}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add_shopping_cart_rounded),
        label: GetX<CartController>(
          builder: (controller) {
            return Text(controller.count.toString());
          },
        ),
      ),
    );
  }
}
