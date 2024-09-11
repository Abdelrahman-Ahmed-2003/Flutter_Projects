import 'dart:async';

import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
 
   @override
void initState() {
  super.initState();
  
}

void callback() {
    Navigator.pushReplacementNamed(context, '/first');
  }

  void callback2() {
    Navigator.pushReplacementNamed(context, '/MainPage');
  }




Future<void> _initialize() async {
  if (await IsFirstRun.isFirstRun()) {
    Timer(const Duration(seconds: 3), callback);
  } else {
    Timer(const Duration(seconds: 3), callback2);
  }
}

  @override
  Widget build(BuildContext context) {
    _initialize();
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Image.asset(        
          "lib/images/work.jpg",
          fit: BoxFit.fill,
          
        ),
      ),
    );
  }


}
