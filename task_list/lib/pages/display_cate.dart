import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';
import 'package:task_list/pages/display_tasks.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCubit, DataState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.watch<DataCubit>();
        return PopScope(
            onPopInvoked: (didPop) {
              if (didPop) {
                cubit.changeSelCategory("");
              }
            },
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blue,
                ),
                body: Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        Text("All Tasks in ${cubit.getcategory()}",
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white)),
                        const DisplayTask(),
                      ],
                    ))));
      },
    );
  }
}
