import 'package:get/get.dart';
import 'package:first_getx_app/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var productResult = [
      Product(
        id: 1,
        productName: 'FirstProd',
        productImage: 'abd',
        productDescription: 'productDescription',
        price: 30,
      ),
      Product(
        id: 2,
        productName: 'SecondProd',
        productImage: 'abd',
        productDescription: 'productDescription',
        price: 40,
      ),
      Product(
        id: 3,
        productName: 'ThirdProd',
        productImage: 'abd',
        productDescription: 'productDescription',
        price: 50,
      ),
    ];

    products.value = productResult;
  }
}
