import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/model.dart';
part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  Position? positionnnn;
  Model? model;

  setposition(Position position) {
    this.positionnnn = position;
    emit(SetPosition());
  }
  getposition() {
    return positionnnn;
  }
}