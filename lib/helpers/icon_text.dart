class IconText {
  String getImages(
    int code,
    int dateTime,
    int sunriseTS,
    int sunsetTS,
  ) {
    var now = DateTime.now().millisecondsSinceEpoch / 1000;
    var currentTime = now.toInt();
    // var updateTime = dateTime;
    var sunrise = sunriseTS;
    var sunset = sunsetTS;

    if (code == 800 && currentTime >= sunrise && currentTime < sunset) {
      return 'clear-day.png';
    } else if (code == 800 && currentTime >= sunset ||
        code == 800 && currentTime >= 0 && currentTime < sunrise) {
      return 'clear-night.png';
    } else if (code >= 801 &&
        code <= 802 &&
        currentTime >= sunrise &&
        currentTime < sunset) {
      return 'partly-cloudy-day.png';
    } else if (code >= 801 && code <= 802 && currentTime >= sunset ||
        code >= 801 &&
            code <= 802 &&
            currentTime >= 0 &&
            currentTime < sunrise) {
      return 'partly-cloudy-night.png';
    } else if (code >= 803 && code <= 804) {
      return 'cloudy.png';
    } else if (code > 700 && code < 800) {
      return 'fog.png';
    } else if (code >= 600 && code < 650) {
      return 'snow.png';
    } else if (code >= 300 && code < 550) {
      return 'rain.png';
    } else if (code >= 200 && code < 250) {
      return 'thunderstorm.png';
    } else if (code == 100) {
      return 'wind.png';
    }
    return 'na.png';
  }

  String getSeason(int month) {
    if (month == 12 || month == 1 || month == 2) {
      return 'Winter';
    } else if (month >= 3 && month <= 5) {
      return 'Spring';
    } else if (month >= 6 && month <= 8) {
      return 'Summer';
    } else if (month >= 9 && month <= 11) {
      return 'Fall';
    }
    return 'Season';
  }

  String getBackground(
    int code,
    int sunriseTS,
    int sunsetTS,
  ) {
    var sunrise = sunriseTS;
    var sunset = sunsetTS;
    var now = DateTime.now().millisecondsSinceEpoch / 1000;
    var currentTime = now.toInt();
    var dateTime = DateTime.fromMillisecondsSinceEpoch(currentTime * 1000);
    var season = getSeason(dateTime.month);
    // print('Season$season.jpg');

    if (currentTime >= sunset || currentTime >= 0 && currentTime < sunrise) {
      return 'night.jpg';
    } else if (code == 800) {
      return 'sunny$season.jpg';
    } else if (code >= 801 && code < 805) {
      return 'cloudy$season.jpg';
    } else if (code > 700 && code < 800) {
      return 'foggy$season.jpg';
    } else if (code >= 600 && code < 650) {
      return 'snow.jpg';
    } else if (code >= 300 && code < 550) {
      return 'rain$season.jpg';
    } else if (code >= 200 && code < 250) {
      return 'thunderstorm.jpg';
    }
    return 'cloudy$season.jpg';
  }
}
