part of 'data_cubit.dart';

@immutable
sealed class DataState {}

final class DataInitial extends DataState {}

class SetPosition extends DataState {
  SetPosition();
}