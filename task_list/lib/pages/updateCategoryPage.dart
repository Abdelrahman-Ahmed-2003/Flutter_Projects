import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/componants/custom_category.dart';
import 'package:task_list/componants/navigationbar.dart';
import 'package:task_list/cubits/cubit/cubit_category.dart';

// ignore: must_be_immutable
class UpdateCategory extends StatelessWidget {
  UpdateCategory({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CategoryCubit>();
    List<String> listCat = [];
    listCat.addAll(cubit.listCat);
    late List<bool> isPressed =
        List.generate(cubit.listCat.length, (index) => false);
    for(int i = 0; i < cubit.categories.length; i++){
      if(!listCat.contains(cubit.categories[i])){
        listCat.add(cubit.categories[i]);
        isPressed.add(true);
      }
      isPressed[listCat.indexOf(cubit.categories[i])] = true;
    }

    
    isPressed.addAll(List.generate(cubit.categories.length, (index) => true));
    
    return Scaffold(
      bottomNavigationBar:BottomNavigation(index: 2),
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
                      name: "Update Categories",
                      listCat: listCat,
                      isPressed: isPressed,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (isPressed.contains(true)) {
                  cubit.categories = listCat.where((element) => isPressed[listCat.indexOf(element)]).toList();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Categories updated successfully'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please choose at least one category'),
                    ),
                  );
                }
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}