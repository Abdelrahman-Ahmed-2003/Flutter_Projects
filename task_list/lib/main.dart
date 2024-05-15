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
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        // Match the route name with a widget
        switch (settings.name) {
          case '/':
            builder = (BuildContext _) => const MianPage();
            break;
          case '/calendar':
            builder = (BuildContext _) => const Calendar();
            break;
          case '/addtask':
            final Map arguments = settings.arguments as Map;
            builder = (BuildContext _) => AddTask(
              task: arguments['task'],
              index: arguments['index'],
            );
            break;
          case '/displaycate':
            builder = (BuildContext _) => const Category();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        // You can also extract the arguments using settings.arguments here

        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => builder(context),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1.0, 0.0);
            var end = Offset.zero;
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
      },
      debugShowCheckedModeBanner: false,
    );
  }
}