import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';
import 'package:task_list/pages/display_tasks.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focus, cubit) {
    cubit.changeSelDate(day.toString().split(" ")[0]);
    setState(() {
      today = day;
    });
  }

  Color clor = const Color.fromARGB(255, 26, 29, 183);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCubit, DataState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.watch<DataCubit>();
        return PopScope(
          onPopInvoked: (didPop) {
            if (didPop) {
              cubit.changeSelDate(DateTime.now().toString().split(" ")[0]);
            }
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
            ),
            body: Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text(
                    "The selected day is ${today.toString().split(" ")[0]}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  TableCalendar(
                    headerStyle: const HeaderStyle(
                        formatButtonVisible: false, titleCentered: true),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    focusedDay: today,
                    firstDay: DateTime.utc(1987, 1, 1),
                    lastDay: DateTime.utc(2100, 12, 12),
                    onDaySelected: (selectedDay, focusedDay) {
                      _onDaySelected(selectedDay, focusedDay, cubit);
                    },
                  ),
                  const DisplayTask(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
