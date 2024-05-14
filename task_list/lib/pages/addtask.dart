import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';
import 'package:task_list/data/data.dart';

import 'package:task_list/pages/task.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String title = "";
  String desc = "";
  TimeOfDay time = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  String category = 'work';

  GlobalKey<FormState> formKey = GlobalKey();
  Color clor = const Color.fromARGB(255, 26, 180, 183);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCubit, DataState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.watch<DataCubit>();
        var task = Task();
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                task.time = "${time.hour} : ${time.minute}";
                task.date = dateTime.toString().split(" ")[0];
                task.category = category;
                cubit.addTask(task);
                Navigator.of(context).pop();
              }
            },
            child: const Icon(Icons.check),
          ),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.teal,
            title: const Center(
              child: Text("New Task"),
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
                      maxLines: 2,
                      maxLength: 100,
                      onSaved: (newValue) {
                        task.title = newValue!;
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
                      maxLines: 2,
                      maxLength: 400,
                      onSaved: (newValue) {
                        task.desc = newValue!;
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
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              "Time",
                              style: TextStyle(fontSize: 20, color: Colors.white),
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
                                dateTime = newdate;
                              });
                            }
                          },
                          child: Text(
                            dateTime.toString().split(" ")[0],
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
                                  time = newtime;
                                });
                              }
                            },
                            child: Text(
                              "${time.hour} : ${time.minute}",
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
                                                  category == listCat[index]
                                                      ? Colors.white
                                                      : clor)),
                                      child: Text(
                                        listCat[index],
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          category = listCat[index];
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
