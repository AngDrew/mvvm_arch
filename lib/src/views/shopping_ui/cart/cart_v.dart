import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mvvm_arch/src/constants/route_c.dart';
import 'package:mvvm_arch/src/views/shopping_ui/shopping_vm.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, productRoute);
        //     },
        //     icon: Icon(Icons.shopping_cart_rounded),
        //   ),
        // ],
      ),
      body: Consumer<ShoppingViewModel>(
        builder: (
          BuildContext context,
          ShoppingViewModel value,
          Widget? child,
        ) =>
            ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => Container(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value.productsInCart[index].name),
                const SizedBox(width: 8),
                Text('\$${value.productsInCart[index].price}'),
                Text('(Jum: ${value.productsInCart[index].amount})'),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    value.addToCart(index);
                  },
                  child: Row(
                    children: const <Widget>[
                      Text('Remove From '),
                      Icon(Icons.shopping_cart_rounded),
                      // TODO: klo udah ada di keranjang jadi tombol - jumlah +
                    ],
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: value.productsInCart.length,
        ),
      ),
    );
  }
}
