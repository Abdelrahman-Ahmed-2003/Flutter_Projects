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
  Task task = Task();
  int index = -1;

  changetask(Task task) {
    this.task = task;
    emit(ChangeTask());
  }

  

  getValues() {
    data = box.values.toList();
    emit(DataLoaded(data));
  }

  setindex(index) {
    this.index = index;
    emit(SetIndex());
  }

  changetitle(title) {
    task.title = title;
    emit(ChangeTitle());
  }

  changetime(time) {
    task.time = time;
    emit(ChangeTime());
  }
  
  setDone(bool value) {
    task.isDone = value;
    emit(ChangeDone());
  }

  getDone(){
    return task.isDone;
  }

  changecategory(category) {
    task.category = category;
    emit(ChangeCategory());
  }

  changedate(date) {
    task.date = date;
    emit(ChangeDate());
  }

  changedesc(desc) {
    task.desc = desc;
    emit(ChangeDesc());
  }

  addTask(Task task) {
    box.add(task);
    emit(DataAdded());
  }

  editTask() async{
    await box.putAt(index, task);
    emit(TaskEdit());
  }

  deleteTask(index) {
    box.deleteAt(index);
    emit(DataRemove());
  }

  changeSelDate(date) {
    selectedDate = date;
    emit(ChangeSelDate());
  }

  getDate() {
    return selectedDate;
  }

  changeCategory(category) {
    task.category = category;
    emit(categoryChanged());
  }

  changeSelCategory(category) {
    selectedCategory = category;
    emit(ChangeSelCategory());
  }

  getcategory() {
    return selectedCategory;
  }
}
