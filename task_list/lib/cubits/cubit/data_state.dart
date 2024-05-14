part of 'data_cubit.dart';

@immutable
sealed class DataState {}

final class DataInitial extends DataState {}

class DataLoaded extends DataState {
  final List<dynamic> data;
  DataLoaded(this.data);
}


class TaskEdit extends DataState {
  TaskEdit();
}

class DataAdded extends DataState {
  DataAdded();
}


class ChangeSelCategory extends DataState {
  ChangeSelCategory();
}


class DataRemove extends DataState {
  DataRemove();
}

class ChangeSelDate extends DataState {
  ChangeSelDate();
}
