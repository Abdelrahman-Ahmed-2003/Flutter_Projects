import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';
import 'package:task_list/data/data.dart';

import 'package:task_list/pages/task.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  GlobalKey<FormState> formKey = GlobalKey();
  Color clor = const Color.fromARGB(255, 26, 180, 183);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCubit, DataState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.watch<DataCubit>();

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                cubit.editTask();
                cubit.setindex(-1);
                cubit.changetask(Task());
                Navigator.of(context).pop();
              }
            },
            child: const Icon(Icons.check),
          ),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.teal,
            title: const Center(
              child: Text("Edit Task"),
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      initialValue: cubit.task.title,
                      maxLines: 2,
                      maxLength: 100,
                      onSaved: (newValue) {
                        cubit.task.title = newValue!;
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
                    const Spacer(),
                    TextFormField(
                      initialValue: cubit.task.desc,
                      maxLines: 2,
                      maxLength: 400,
                      onSaved: (newValue) {
                        cubit.task.desc = newValue!;
                      },
                      decoration: const InputDecoration(
                          labelText: "Description",
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    const Spacer(),
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
                              cubit
                                  .changedate(newdate.toString().split(" ")[0]);
                            }
                          },
                          child: Text(
                            cubit.task.date,
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
                                cubit.changetime(
                                    "${newtime.hour} : ${newtime.minute}");
                              }
                            },
                            child: Text(
                              cubit.task.time,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ))
                      ],
                    ),
                    const Spacer(),
                    const Text("Category",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: listCat.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        cubit.task.category == listCat[index]
                                            ? Colors.white
                                            : clor)),
                                child: Text(
                                  listCat[index],
                                  style: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  cubit.changeCategory(listCat[index]);
                                },
                              ),
                            ],
                          );

                          //const SizedBox(width: 100, height: 100,)
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                      ),
                    )
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
