import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/location/current_location.dart';
import 'package:intl/intl.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  Position? position;
  Model? model;
  var week = [];

  getLocation() async {
    CurrentLocation location = CurrentLocation();
    position = await location.determinePosition();
    emit(DataLoaded());
  }

  getWeather() {
    WeatherApi api = WeatherApi();
    api.fetchWeather(position!.altitude, position!.longitude).then((value) {
      model = value;
      print(
                              "***************************************************updated data");
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

  setDays() {
    week = [];
    for (var i = 1; i < model!.forecast!.forecastday!.length; i += 1) {
      var day = DateTime.now().add(Duration(days: i));
      week.add(DateFormat('EEEE').format(day));
    }
    
    emit(SetDate());
  }
}
