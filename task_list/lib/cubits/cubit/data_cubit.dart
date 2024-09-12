import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:task_list/tasks/task.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  final Box<Task>box = Hive.box<Task>("task_box");
  List<Task> data = [];
  List<Task> listfilter = [];
  String category = "";

  getTasks() {
    data = box.values.toList() ;
  }

  void getValues(String filterName, String filter) {
    listfilter = [];
    if (filterName != "") {
      if (filterName == "category") {
        category = filter;
        listfilter =
            data.where((element) => element.category == filter).toList();
      } else if (filterName == "date") {
        listfilter =
            data.where((element) => element.date == filter).toList();
      }
    } else {
      listfilter.addAll(data);
    }
    emit(DataLoaded());
  }

  addTask(Task task) async {
    data.add(task);
    emit(DataAdded());
    await box.add(task);
  }

  editTask(int index, Task task) async {
    data[index] = task;
    emit(TaskEdit());
    await box.putAt(index, task);
  }

  deleteTask(index) {
    data.removeAt(index);
    emit(DataRemove());
    box.deleteAt(index);
  }

  void updateTask(int index, bool? value) {
    data[index].isDone = value ??false;
    emit(DataUpdate());
    box.putAt(index, data[index]);
  }
}
