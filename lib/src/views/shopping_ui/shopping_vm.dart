import 'package:flutter/foundation.dart';
import 'package:mvvm_arch/src/logic/repositories/product_repo.dart';
import 'package:mvvm_arch/src/models/local/product_m.dart';

class ShoppingViewModel extends ChangeNotifier {
  ShoppingViewModel() {
    _repo = ProductRepository();

    init();
  }

  late final ProductRepository _repo;

  List<ProductModel> products = <ProductModel>[];
  List<ProductModel> productsInCart = <ProductModel>[];

  Future<void> init() async {
    products = await _repo.getProducts();
    notifyListeners();
  }

  void addToCart(int index) {
    //product amount -1
    //cart amount +1
    //cart amount tidak boleh melebihi batas stok (product amount)

    if (!productAlreadyOnCart(products[index])) {
      productsInCart.add(
        products[index].copyWith(
          amount: 1,
        ),
      );
    } else {
      int indexWhere = productsInCart
          .indexWhere((element) => element.name == products[index].name);

      productsInCart[indexWhere] = productsInCart[indexWhere].copyWith(
        amount: productsInCart[indexWhere].amount + 1,
      );
    }

    if (products[index].amount <= 1) {
      products.removeAt(index);
    } else {
      products[index] = products[index].copyWith(
        amount: products[index].amount - 1,
      );
    }

    notifyListeners();
  }

  bool productAlreadyOnCart(ProductModel product) =>
      productsInCart.contains(product);
}
