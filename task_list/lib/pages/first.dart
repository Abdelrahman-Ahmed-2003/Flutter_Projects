import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        color: Colors.teal,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Welcome to you',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'This is your first time using Task List so you must choose at least one category to start adding tasks',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Spacer(),
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
                      cubit.listCat.length,
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
                        child: Text(cubit.listCat[index]),
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
              onSubmitted: (value) {
                cubit.addCategory(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      controller.clear();
                      isPressed.add(true);
                      cubit.addCategory(controller.text);
                      
                    },
                    child:const Text('Add'));
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (isPressed.contains(true)) {
                    Navigator.pushNamed(context, '/MainPage');
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
