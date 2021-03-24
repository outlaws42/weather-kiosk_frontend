import 'package:flutter/material.dart';
import '../models/current_model.dart';
import '../models/forecast_model.dart';
import '../models/past_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherProvider extends ChangeNotifier {
  List<CurrentModel> _current = [];
  List<ForecastModel> _forecast = [];
  List<PastModel> _year = [];
  List<PastModel> _day = [];
  // List<IndoorModel> _indoor = [];

  List<CurrentModel> get current {
    return [..._current];
  }

  List<ForecastModel> get forecast {
    return [..._forecast];
  }

  List<PastModel> get year {
    return [..._year];
  }

  List<PastModel> get day {
    return [..._day];
  }

  Future<void> fetchCurrent(
    String baseName,
    String portName,
    String currentName,
  ) async {
    final url = 'http://$baseName:$portName/weather/$currentName';

    final List<CurrentModel> loadCurrent = [];
    try {
      final response = await http.get(url);
      print(response.body);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((key, value) {
        loadCurrent.add(
          CurrentModel(
            icon: value['current_icon'],
            feelsLike: value['current_feels_like'],
            humidity: value['current_humidity'],
            windSpeed: value['current_wind_speed'],
            windDir: value['current_wind_dir'],
            updated: value['updated'],
            temp: value['current_temp'],
            status: value['current_status'],
            sunrise: value['current_sunrise'],
            sunset: value['current_sunset'],
          ),
        );
      });
    } catch (error) {
      const inErrorString = 'NA';
      const inErrorInt = 0;
      loadCurrent.add(
        CurrentModel(
          icon: inErrorInt,
          feelsLike: inErrorInt,
          humidity: inErrorString,
          windSpeed: inErrorInt,
          windDir: inErrorString,
          updated: inErrorInt,
          temp: inErrorInt,
          status: inErrorString,
          sunrise: inErrorInt,
          sunset: inErrorInt,
        ),
      );
    }

    _current = loadCurrent;
    notifyListeners();
  }

  Future<void> fetchForecast(
    String baseName,
    String portName,
    String forecastName,
  ) async {
    final url = 'http://$baseName:$portName/weather/$forecastName';

    final List<ForecastModel> loadForecast = [];
    try {
      final response = await http.get(url);
      print(response.body);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((key, value) {
        loadForecast.add(
          ForecastModel(
              date: value['date'],
              day0Icon: value['day0_icon'],
              day1Icon: value['day1_icon'],
              day2Icon: value['day2_icon'],
              day0Pop: value['day0_pop'],
              day1Pop: value['day1_pop'],
              day2Pop: value['day2_pop'],
              day0TempLow: value['day0_temp_low'],
              day0TempHigh: value['day0_temp_high'],
              day1TempLow: value['day1_temp_low'],
              day1TempHigh: value['day1_temp_high'],
              day2TempLow: value['day2_temp_low'],
              day2TempHigh: value['day2_temp_high'],
              day0Dow: value['day0_dow'],
              day1Dow: value['day1_dow'],
              day2Dow: value['day2_dow']),
        );
      });
    } catch (error) {
      const inErrorString = 'NA';
      const inErrorInt = 0;
      loadForecast.add(
        ForecastModel(
          date: inErrorInt,
          day0Icon: inErrorInt,
          day1Icon: inErrorInt,
          day2Icon: inErrorInt,
          day0Pop: inErrorString,
          day1Pop: inErrorString,
          day2Pop: inErrorString,
          day0TempLow: inErrorInt,
          day0TempHigh: inErrorInt,
          day1TempLow: inErrorInt,
          day1TempHigh: inErrorInt,
          day2TempLow: inErrorInt,
          day2TempHigh: inErrorInt,
          day0Dow: inErrorString,
          day1Dow: inErrorString,
          day2Dow: inErrorString,
        ),
      );
    }
    _forecast = loadForecast;
    notifyListeners();
  }

  Future<void> fetchPast(
    String baseName,
    String portName,
    String pastName,
    String past,
  ) async {
    final url = 'http://$baseName:$portName/weather/$pastName/$past';
    final List<PastModel> loadPast = [];
    try {
      final response = await http.get(url);
      print(response.body);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((key, value) {
        loadPast.add(
          PastModel(
            icon: value['icon'],
            high: value['high'],
            low: value['low'],
            date: value['date'],
          ),
        );
      });
    } catch (error) {
      loadPast.add(
        PastModel(
          icon: 0,
          high: 0,
          low: 0,
          date: 0,
        ),
      );
    }
    if (past == 'year') {
      _year = loadPast;
    } else {
      _day = loadPast;
    }
    notifyListeners();
  }

}
