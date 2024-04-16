part of 'data_cubit.dart';

@immutable
sealed class DataState {}

final class DataInitial extends DataState {}

class DataLoaded extends DataState {
  final List<dynamic> data;
  DataLoaded(this.data);
}

class ChangeTask extends DataState {
  ChangeTask();
}

class TaskEdit extends DataState {
  TaskEdit();
}

class DataAdded extends DataState {
  DataAdded();
}

class ChangeTitle extends DataState {
  ChangeTitle();
}

class ChangeTime extends DataState {
  ChangeTime();
}

class SetIndex extends DataState {
  SetIndex();
}

class ChangeDate extends DataState {
  ChangeDate();
}

class ChangeDone extends DataState {
  ChangeDone();
}

class ChangeCategory extends DataState {
  ChangeCategory();
}

class ChangeSelCategory extends DataState {
  ChangeSelCategory();
}

class ChangeDesc extends DataState {
  ChangeDesc();
}

class DataRemove extends DataState {
  DataRemove();
}

class ChangeSelDate extends DataState {
  ChangeSelDate();
}

class categoryChanged extends DataState {
  categoryChanged();
}
