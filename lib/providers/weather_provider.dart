// import 'dart:math';

import 'package:flutter/material.dart';
import '../models/current_model.dart';
import '../models/forecast_model.dart';
import '../models/past_model.dart';
import '../models/indoor_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherProvider extends ChangeNotifier {
  List<CurrentModel> _current = [];
  List<ForecastModel> _forecast = [];
  List<PastModel> _year = [];
  List<PastModel> _day = [];
  List<IndoorModel> _indoor = [];

  List<CurrentModel> get current {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._current];
  }

  List<ForecastModel> get forecast {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._forecast];
  }

  List<PastModel> get year {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._year];
  }

  List<PastModel> get day {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._day];
  }

  List<IndoorModel> get indoor {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._indoor];
  }

  Future<void> fetchCurrent() async {
    const url = 'http://192.168.1.3:5000/current';

    final response = await http.get(url);
    final List<CurrentModel> loadCurrent = [];
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
    _current = loadCurrent;
    notifyListeners();
  }

  Future<void> fetchForecast() async {
    const url = 'http://192.168.1.3:5000/forecast';

    final response = await http.get(url);
    final List<ForecastModel> loadForecast = [];
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
            day0Temp: value['day0_temp'],
            day1Temp: value['day1_temp'],
            day2Temp: value['day2_temp'],
            day0Dow: value['day0_dow'],
            day1Dow: value['day1_dow'],
            day2Dow: value['day2_dow']),
      );
    });
    _forecast = loadForecast;
    notifyListeners();
  }

  Future<void> fetchPast(
    String past,
  ) async {
    var url = 'http://192.168.1.3:5000/HighLow/$past';
    final response = await http.get(url);
    final List<PastModel> loadPast = [];
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
    if (past == 'year') {
      _year = loadPast;
    } else {
      _day = loadPast;
    }
    notifyListeners();
  }

  Future<void> fetchIndoor() async {
    var url = 'http://192.168.1.3:5000/indoor';
    final response = await http.get(url);
    final List<IndoorModel> loadIndoor = [];
    print(response.body);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach((key, value) {
      loadIndoor.add(
        IndoorModel(
          front: value['front_room'],
          date: value['dt'],
        ),
      );
    });

    _indoor = loadIndoor;
    notifyListeners();
  }
}
