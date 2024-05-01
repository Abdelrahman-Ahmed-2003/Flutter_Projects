import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/cubites/data_cubit.dart';
import 'package:weather_app/model/model.dart';

class WeatherApi {
  final String _apiKey = '639d1ea8131749c88ee150144242604';

  Future<Model> fetch(BuildContext context) async {
    var cubit = context.read<DataCubit>();
    final String baseUrl =
        'https://api.weatherapi.com/v1/forecast.json?key=$_apiKey&q=${cubit.getposition().latitude},${cubit.getposition().longitude}&days=7';
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return Model.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
