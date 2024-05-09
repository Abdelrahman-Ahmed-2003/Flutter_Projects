import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/location/current_location.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  Position? position;
  Model? model;

  getLocation() async {

    emit(DataLoading());
    CurrentLocation location = CurrentLocation();
    position = await location.determinePosition();
    emit(DataLoaded()); 
}

  getWeather(){
    emit(DataLoading());
    WeatherApi api = WeatherApi();
    api.fetchWeather(position!.altitude, position!.longitude).then((value) {
      model = value;
      emit(DataLoaded());
    });
    
  }

  setposition(Position position) {
    this.position = position;
    emit(SetPosition());
  }

  getposition() {
    return position;
  }
}
