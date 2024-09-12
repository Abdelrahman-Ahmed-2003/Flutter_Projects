import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/componants/custom_category.dart';
import 'package:task_list/cubits/cubit/cubit_category.dart';

// ignore: must_be_immutable
class FirstOpen extends StatelessWidget {
  FirstOpen({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CategoryCubit>();
    late List<bool> isPressed =
        List.generate(cubit.listCat.length, (index) => false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Task List',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: double.infinity,
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    CustomCategories(
                      name: "Welcome to you",
                      listCat: cubit.listCat,
                      isPressed: isPressed,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (isPressed.contains(true)) {
                    Navigator.pushReplacementNamed(context, "/MainPage");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please choose at least one category'),
                      ),
                    );
                  }
                },
                child: const Text('Get Started'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}