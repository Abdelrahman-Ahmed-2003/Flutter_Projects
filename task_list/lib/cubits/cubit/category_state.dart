part of 'cubit_category.dart';

class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoaded extends CategoryState {
  
  CategoryLoaded();
}

class CategoryAdded extends CategoryState {}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}