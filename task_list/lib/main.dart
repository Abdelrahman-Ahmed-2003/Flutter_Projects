import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_list/componants/custom_category.dart';
import 'package:task_list/cubits/cubit/cubit_category.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';
import 'package:task_list/pages/addtaskPage.dart';
import 'package:task_list/pages/calendarPage.dart';
import 'package:task_list/pages/display_catePage.dart';
import 'package:task_list/pages/firstOpenPage.dart';
import 'package:task_list/pages/main_page.dart';
import 'package:task_list/pages/splashPage.dart';
import 'package:task_list/pages/updateCategoryPage.dart';
import 'package:task_list/tasks/task.dart';

// solve
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  //await Hive.deleteBoxFromDisk('task_box');
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>("task_box");
  await Hive.openBox("category_box");
  //Bloc.observer = MyBlocObserver();
  runApp( MultiBlocProvider(
      providers: [
        BlocProvider<DataCubit>(
          create: (context) => DataCubit(),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit(),
        ),
        // Add more BlocProviders here as needed
      ],
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
        '/': (context) => const SplashScreen(),
        '/calendar': (context) => const Calendar(),
        '/MainPage': (context) => const MianPage(),
        '/addtask': (context) {
          final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
          return AddTask(
            task: arguments['task'],
            index: arguments['index'],
          );
        },
        '/displaycate': (context) => const Category(),
        '/first': (context) => FirstOpen(),
        '/updatecate': (context) =>  UpdateCategory(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
