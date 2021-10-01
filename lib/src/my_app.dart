import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_arch/src/logic/route.dart';
import 'package:mvvm_arch/src/views/shopping_ui/shopping_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<ShoppingViewModel>(
          create: (BuildContext context) => ShoppingViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Architecture',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
