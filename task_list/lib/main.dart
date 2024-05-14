import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_list/blocObserver.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';
import 'package:task_list/pages/addtask.dart';
import 'package:task_list/pages/calendar.dart';
import 'package:task_list/pages/display_cate.dart';
import 'package:task_list/pages/main_page.dart';
import 'package:task_list/pages/task.dart';

// solve
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  //await Hive.deleteBoxFromDisk('task_box');
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox("task_box");
  Bloc.observer = MyBlocObserver();
  runApp(BlocProvider(
    create: (context) => DataCubit(),
    child: const MyWidget(),
  ));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MianPage(),
        '/calendar': (context) => const Calendar(),
        '/addtask': (context) {
          final Map arguments =
              ModalRoute.of(context)!.settings.arguments as Map;
          return AddTask(
            task: arguments['task'],
            index: arguments['index'],
          );
        },
        '/displaycate': (context) => const Category(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
