import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';
import 'package:task_list/pages/task.dart';

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
        List tasks = [];
        cubit.getValues();
        if (cubit.getcategory() != "") {
          for (var element in cubit.data) {
            if (element.category == cubit.getcategory()) {
              tasks.add(element);
            }
          }
        } else {
          for (var element in cubit.data) {
            if (element.date == cubit.getDate()) {
              tasks.add(element);
            }
          }
        }

        if (tasks.isEmpty) {
          return const Center(
            child: Text("No Tasks"),
          );
        }
        return Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
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
                                const SizedBox(
                                  width: 50,
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
                                const Spacer(),
                                IconButton(
                                    onPressed: tasks[index].isDone
                                        ? null
                                        : () {
                                            cubit.setindex(index);
                                            cubit.changetask(tasks[index]);
                                            Navigator.pushNamed(
                                                context, "/edit_task");
                                          },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: tasks[index].isDone
                                        ? null
                                        : () {
                                            cubit.deleteTask(index);
                                          },
                                    icon: const Icon(Icons.delete)),
                              ],
                            ),
                            Row(
                              children: [
                                Text(tasks[index].desc,
                                    style: TextStyle(
                                      decoration: tasks[index].isDone
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                    )),
                              ],
                            ),
                            const Divider(),
                          ],
                        )),
                    if (index == tasks.length - 1)
                      const SizedBox(
                        height: 100,
                        width: 100,
                      ),
                  ],
                );
              }),
        );
      },
    );
  }
}
