import 'package:flutter/material.dart';
import 'package:mvvm_arch/src/constants/route_c.dart';
import 'package:mvvm_arch/src/views/counter/counter_v.dart';
import 'package:mvvm_arch/src/views/counter/counter_vm.dart';
import 'package:mvvm_arch/src/views/shopping_ui/cart/cart_v.dart';
import 'package:mvvm_arch/src/views/shopping_ui/prduct/product_v.dart';
import 'package:mvvm_arch/src/views/shopping_ui/shopping_vm.dart';
import 'package:mvvm_arch/src/views/splash/splash_v.dart';
import 'package:provider/provider.dart';

Route<dynamic>? onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case rootRoute:
      return MaterialPageRoute(
          builder: (context) => SplashScreen(), settings: setting);
    case loginRoute:
      return MaterialPageRoute(
          builder: (context) => SizedBox(), settings: setting);
    case registerRoute:
      return MaterialPageRoute(
          builder: (context) => SizedBox(), settings: setting);
    case forgetPasswordRoute:
      return MaterialPageRoute(
          builder: (context) => SizedBox(), settings: setting);
    case counterRoute:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<CounterViewModel>(
                create: (context) => CounterViewModel(),
                child: CounterView(),
              ),
          settings: setting);
    case productRoute:
      return MaterialPageRoute(
        builder: (context) => ProductScreen(),
        settings: setting,
      );
    case cartRoute:
      return MaterialPageRoute(
        builder: (context) => CartScreen(),
        settings: setting,
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('404 Not Found'),
          ),
        ),
      );
  }
}
