import 'dart:async';

import 'package:bmi_calculator/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    
    Timer(const Duration(seconds: 3), () {

      Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
              builder: (context) => const HomeScreen(),
              ),
      );
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/animations/bmi_animation.json',
          repeat: false,
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}