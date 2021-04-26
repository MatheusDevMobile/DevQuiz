import 'package:dquiz/core/core.dart';
import 'package:dquiz/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
