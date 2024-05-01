import 'package:weather_app/cubites/data_cubit.dart';
import 'package:weather_app/location/current_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/views/home_page.dart';
import 'package:weather_app/views/week_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => DataCubit(),
    child: const MyWidget(),
  ));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/WeekPage': (context) => const WeekPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
