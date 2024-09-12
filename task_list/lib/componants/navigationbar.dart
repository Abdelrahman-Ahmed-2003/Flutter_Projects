import 'package:flutter/material.dart';
import 'package:task_list/tasks/task.dart';

class BottomNavigation extends StatelessWidget {
  int index;
  BottomNavigation({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add Task',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Categories',
        ),
      ],
      selectedItemColor: Colors.teal,
      currentIndex: index,
      onTap: (int index) {
        switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, "/MainPage");
              break;
            case 1:
              Navigator.pushReplacementNamed(context, "/addtask", arguments: {
                'task': Task(),
                'index': -1,
              });
              break;
            case 2:
              Navigator.pushReplacementNamed(context, "/updatecate");
              break;
          }
      },
    );
  }
}
