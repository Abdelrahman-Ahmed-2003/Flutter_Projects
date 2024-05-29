import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';

class DisplayTask extends StatefulWidget {
  const DisplayTask({super.key});

  @override
  State<DisplayTask> createState() => _DisplayTaskState();
}

class _DisplayTaskState extends State<DisplayTask> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCubit, DataState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<DataCubit>();
        List tasks = cubit.data;

        if (tasks.isEmpty) {
          return const Center(
            child: Text("No Tasks"),
          );
        }
        return ListView.builder(
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Dismissible(
                    key: ValueKey(index),
                    onDismissed: (direction) {
                      cubit.deleteTask(index);
                    },
                    child: ListTile(
                        enabled: tasks[index].isDone ? false : true,
                        leading: Checkbox(
                          activeColor: Colors.green,
                          value: tasks[index].isDone ? true : false,
                          onChanged: (bool? value) {
                            setState(() {
                              tasks[index].isDone = value ??
                                  false; // Update the isDone property of the task
                            });
                          }, //tasks[index].isDone
                        ),
                        title: Text(
                          tasks[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            decoration: tasks[index].isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tasks[index].time,
                                  style: TextStyle(
                                    fontSize: 12,
                                    decoration: tasks[index].isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  tasks[index].category,
                                  style: TextStyle(
                                    fontSize: 14,
                                    decoration: tasks[index].isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                                IconButton(
                                    onPressed: tasks[index].isDone
                                        ? null
                                        : () {
                                            Navigator.pushNamed(
                                              context,
                                              "/addtask",
                                              arguments: {
                                                'task': tasks[index],
                                                'index': index,
                                              },
                                            );
                                          },
                                    icon: const Icon(Icons.edit)),
                                /*IconButton(
                                    onPressed: tasks[index].isDone
                                        ? null
                                        : () {
                                            cubit.deleteTask(index);
                                          },
                                    icon: const Icon(Icons.delete)),*/
                              ],
                            ),
                            Text(tasks[index].desc,
                                style: TextStyle(
                                  decoration: tasks[index].isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                )),
                            const Divider(),
                          ],
                        )),
                  ),
                  if (index == tasks.length - 1)
                    const SizedBox(
                      height: 60,
                    ),
                ],
              );
            });
      },
    );
  }
}
