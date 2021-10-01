import 'package:mvvm_arch/src/constants/route_c.dart';
import 'package:mvvm_arch/src/models/local/product_m.dart';

class ProductRepository {
  ProductRepository(); // init object

  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(Duration(seconds: 3));

    return <ProductModel>[
      for (int i = 0; i < 10; i++)
        ProductModel(name: 'name $i', price: i * 1000, amount: 1 * i),
      if (true) ProductModel(name: 'name', price: 100, amount: 10),
      ...[
        ProductModel(name: 'a', price: 1000, amount: 1),
        ProductModel(name: 'b', price: 1000, amount: 3),
        ProductModel(name: 'c', price: 1000, amount: 2),
        ProductModel(name: 'd', price: 1000, amount: 5),
      ],
      ProductModel(name: 'e', price: 1000, amount: 3),
      ProductModel(name: 'f', price: 1000, amount: 12),
    ];
  }
}
