import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';
import 'package:task_list/componants/display_tasks.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCubit, DataState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.watch<DataCubit>();
        return Scaffold(
            appBar: AppBar(
              /*leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/MainPage');
                },
              ),*/
              backgroundColor: Colors.teal,
            ),
            body: Container(
                color: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    Text("All Tasks in ${cubit.category}",
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white)),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: DisplayTask(
                              filterName: "category", filter: cubit.category)),
                    ),
                  ],
                )));
      },
    );
  }
}
