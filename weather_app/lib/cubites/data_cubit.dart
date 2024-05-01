import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  Position? positionnnn;

  setposition(Position position) {
    this.positionnnn = position;
    emit(SetPosition());
  }
  getposition() {
    return positionnnn;
  }
}