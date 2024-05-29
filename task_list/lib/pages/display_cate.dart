import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';
import 'package:task_list/pages/display_tasks.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  @override
  void initState() {
    var cubit = context.read<DataCubit>();
    super.initState();
    cubit.getValues();
  }
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
                  cubit.getValues();
                
              }
            },
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                ),
                body: Container(
                    color: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        Text("All Tasks in ${cubit.getcategory()}",
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white)),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const DisplayTask()),
                        ),
                      ],
                    ))));
      },
    );
  }
}
