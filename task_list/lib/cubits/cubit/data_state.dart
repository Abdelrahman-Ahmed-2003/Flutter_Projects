part of 'data_cubit.dart';

class DataState {}

final class DataInitial extends DataState {}

class DataLoaded extends DataState {
  DataLoaded();
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

class DataUpdate extends DataState {
  DataUpdate();
}
