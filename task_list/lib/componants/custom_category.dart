import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/cubits/cubit/cubit_category.dart';

// ignore: must_be_immutable
class CustomCategories extends StatelessWidget {
  final String name;
  final List<String> listCat;
  final List<bool> isPressed;
  final TextEditingController controller = TextEditingController();

  CustomCategories({
    super.key,
    required this.name,
    required this.listCat,
    required this.isPressed,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CategoryCubit>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      color: Colors.teal,
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Choose at least one category",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.black12,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    listCat.length,
                    (index) => ElevatedButton(
                      onPressed: () {
                        if (isPressed[index]) {
                          isPressed[index] = false;
                          cubit.removeCategory(index);
                        } else {
                          isPressed[index] = true;
                          cubit.addCategory(cubit.listCat[index]);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isPressed[index] ? Colors.blue : Colors.white,
                      ),
                      child: Text(listCat[index]),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Add new category',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  isPressed.add(true);
                  cubit.addCategory(controller.text);
                  controller.clear();
                },
                child: const Text('Add'),
              );
            },
          ),
        ],
      ),
    );
  }
}