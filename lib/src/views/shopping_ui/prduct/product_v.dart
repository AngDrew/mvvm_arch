import 'package:flutter/material.dart';
import 'package:mvvm_arch/src/constants/route_c.dart';
import 'package:mvvm_arch/src/views/shopping_ui/shopping_vm.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.read<ShoppingViewModel>()
    // context.watch<ShoppingViewModel>()
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, cartRoute);
            },
            icon: Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),
      body: Consumer<ShoppingViewModel>(
        builder: (
          BuildContext context,
          ShoppingViewModel value,
          Widget? child,
        ) =>
            ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value.products[index].name),
              const SizedBox(width: 8),
              Text('\$${value.products[index].price}'),
              Text('(Sisa: ${value.products[index].amount})'),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  value.addToCart(index);
                },
                child: Row(
                  children: const <Widget>[
                    Text('Add To '),
                    Icon(Icons.shopping_cart_rounded),
                  ],
                ),
              ),
            ],
          ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: value.products.length,
        ),
      ),
    );
  }
}
