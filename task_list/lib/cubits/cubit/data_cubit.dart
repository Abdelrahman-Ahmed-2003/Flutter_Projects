import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_list/data/data.dart';
import 'package:task_list/pages/task.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  var box = Hive.box("task_box");
  List data = [];

  getValues() {
    data = box.values.toList();
    List tasks = [];
    if (getcategory() != "") {
          for (var element in data) {
            if (element.category == getcategory()) {
              tasks.add(element);
            }
          }
        } else {
          for (var element in data) {
            if (element.date == getDate()) {
              tasks.add(element);
            }
          }
        }
    data = tasks;
    emit(DataLoaded(data));
  }

  addTask(Task task) async {
    await box.add(task);
    emit(DataAdded());
    getValues();
  }

  editTask(int index, Task task) async {
    await box.putAt(index, task);
    emit(TaskEdit());
    getValues();
  }

  deleteTask(index) {
    box.deleteAt(index);
    emit(DataRemove());
    getValues();
  }

  changeSelDate(date) {
    selectedDate = date;
    emit(ChangeSelDate());
  }

  getDate() {
    return selectedDate;
  }

  changeSelCategory(category) {
    selectedCategory = category;
    emit(ChangeSelCategory());
  }

  getcategory() {
    return selectedCategory;
  }
}
