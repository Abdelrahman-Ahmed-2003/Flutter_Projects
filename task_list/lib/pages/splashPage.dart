import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:task_list/cubits/cubit/cubit_category.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
 
   @override
void initState() {
  super.initState();
  context.read<CategoryCubit>().getCategories();
    context.read<DataCubit>().getTasks();
    context.read<DataCubit>().getValues("date", DateTime.now().toString().split(" ")[0]);
  
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
