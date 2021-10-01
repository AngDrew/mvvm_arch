import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mvvm_arch/src/constants/route_c.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2)).then(
          (value) => Navigator.pushReplacementNamed(context, productRoute));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Now Loading. . .'),
      ),
    );
  }
}
