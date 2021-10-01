import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_arch/src/views/counter/counter_vm.dart';
import 'package:provider/provider.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterViewModel>(
              builder: (
                BuildContext context,
                CounterViewModel value,
                Widget? child,
              ) =>
                  Text('${value.i}'),
            ),
            ElevatedButton(
              onPressed: context.read<CounterViewModel>().increment,
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: context.read<CounterViewModel>().decrement,
              child: Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
