class IconText {
  String getImages(
    int code,
    DateTime dateTime,
    DateTime sunrise,
    DateTime sunset,
  ) {
    var hour = dateTime.hour;
    var sunriseHour = sunrise.hour;
    var sunsetHour = sunset.hour;

    var image = 'unknown.png';
    print(hour);
    if (code == 800 && hour >= sunriseHour && hour < sunsetHour) {
      image = 'clear-day.png';
    } else if (code == 800 && hour >= sunsetHour) {
      image = 'clear-night.png';
    } else if (code == 800 && hour >= 0 && hour < sunriseHour) {
      image = 'clear-night.png';
    } else if (code >= 801 && code < 805) {
      image = 'cloudy.png';
    } else if (code > 700 && code < 800) {
      image = 'fog.png';
    } else if (code >= 600 && code < 650) {
      image = 'snow.png';
    } else if (code >= 300 && code < 550) {
      image = 'rain.png';
    } else if (code >= 200 && code < 250) {
      image = 'thunderstorm.png';
    }
    return image;
  }

  String getBackground(int code, DateTime dateTime, sunrise, sunset) {
    var hour = dateTime.hour;
    var sunriseHour = sunrise.hour;
    var sunsetHour = sunset.hour;

    if (hour >= sunsetHour || hour >= 0 && hour < sunriseHour) {
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
