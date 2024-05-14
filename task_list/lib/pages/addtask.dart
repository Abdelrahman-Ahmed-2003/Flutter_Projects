import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';
import 'package:task_list/data/data.dart';

import 'package:task_list/pages/task.dart';

// ignore: must_be_immutable
class AddTask extends StatefulWidget {
  late Task task = Task();
  late int index = -1;
  AddTask({super.key, required this.task, required this.index});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  GlobalKey<FormState> formKey = GlobalKey();
  Color clor = const Color.fromARGB(255, 26, 180, 183);
  bool add = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCubit, DataState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.watch<DataCubit>();
        if (widget.index != -1) {
          add = false;
        } else {
        }
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                print(
                    '*************************** ${widget.task.time}   ${widget.task.date}     ${widget.task.category}           ${widget.task.desc}          ${widget.task.title}                      indexxxxx${widget.index}');
                formKey.currentState!.save();
                if (add) {
                  print('added************************************');
                  cubit.addTask(widget.task);
                } else {
                  print('edited************************************');
                  cubit.editTask(widget.index, widget.task);
                }
                cubit.getValues();
                Navigator.of(context).pop();
              }
            },
            child: const Icon(Icons.check),
          ),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.teal,
            title: Center(
              child: add ? const Text("Add Task") : const Text("Edit Task"),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(15),
              color: Colors.teal,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      initialValue: widget.task.title,
                      maxLines: 2,
                      maxLength: 100,
                      onChanged: (newValue) {
                        widget.task.title = newValue;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter What you need to do :)";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: "What you need to do?",
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    //const Spacer(),
                    TextFormField(
                      initialValue: widget.task.desc,
                      maxLines: 2,
                      maxLength: 400,
                      onChanged: (newValue) {
                        widget.task.desc = newValue;
                      },
                      decoration: const InputDecoration(
                          labelText: "Description",
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    //const Spacer(),
                    Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Date",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              "Time",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () async {
                                DateTime? newdate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100));
                                if (newdate != null) {
                                  setState(() {
                                    widget.task.date =
                                        newdate.toString().split(" ")[0];
                                  });
                                }
                              },
                              child: Text(
                                widget.task.date,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                                onPressed: () async {
                                  TimeOfDay? newtime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now());
                                  if (newtime != null) {
                                    setState(() {
                                      widget.task.time =
                                          "${newtime.hour} : ${newtime.minute}";
                                    });
                                  }
                                },
                                child: Text(
                                  widget.task.time,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ))
                          ],
                        ),
                      ],
                    ),

                    //const Spacer(),

                    Column(
                      children: [
                        const Text("Category",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listCat.length,
                                  itemBuilder: (context, index) {
                                    return TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  widget.task.category ==
                                                          listCat[index]
                                                      ? Colors.white
                                                      : clor)),
                                      child: Text(
                                        listCat[index],
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          widget.task.category = listCat[index];
                                        });
                                      },
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      width: 10,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 125,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
