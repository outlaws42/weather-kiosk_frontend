class IconText {
  String getImages(
    int code,
    int dateTime,
    int sunriseTS,
    int sunsetTS,
  ) {
    var updateTime = dateTime;
    var sunrise = sunriseTS;
    var sunset = sunsetTS;

    if (code == 800 && updateTime >= sunrise && updateTime < sunset) {
      return 'clear-day.png';
    } else if (code == 800 && updateTime >= sunset ||
        code == 800 && updateTime >= 0 && updateTime < sunrise) {
      return 'clear-night.png';
    } else if (code >= 801 &&
        code <= 802 &&
        updateTime >= sunrise &&
        updateTime < sunset) {
      return 'partly-cloudy-day.png';
    } else if (code >= 801 && code <= 802 && updateTime >= sunset ||
        code >= 801 && code <= 802 && updateTime >= 0 && updateTime < sunrise) {
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

  String getBackground(
    int code,
    int time,
    int sunriseTS,
    int sunsetTS,
  ) {
    var sunrise = sunriseTS;
    var sunset = sunsetTS;
    var updateTime = time;

    if (updateTime >= sunset || updateTime >= 0 && updateTime < sunrise) {
      return 'night.jpg';
    } else if (code == 800) {
      return 'sunny.jpg';
    } else if (code >= 801 && code < 805) {
      return 'cloudy.jpg';
    } else if (code > 700 && code < 800) {
      return 'foggy.jpg';
    } else if (code >= 600 && code < 650) {
      return 'snowy.jpg';
    } else if (code >= 300 && code < 550) {
      return 'rain.jpg';
    } else if (code >= 200 && code < 250) {
      return 'thunderstorm.jpg';
    }
    return 'cloudy.jpg';
  }
}
