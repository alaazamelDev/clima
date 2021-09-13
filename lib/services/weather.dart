import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '16d2d8ced286674bd27452ce59c6d00e';
const String currentLocationWeatherURL =
    'https://api.openweathermap.org/data/2.5/weather?';
const String cityWeatherURL =
    'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      cityWeatherURL + 'q=$cityName' + '&appid=$apiKey' + '&units=metric',
    );
    var cityWeatherData = await networkHelper.getData();
    return cityWeatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
      currentLocationWeatherURL +
          'appid=$apiKey' +
          '&lat=${location.latitude}' +
          '&lon=${location.longitude}' +
          '&units=metric',
    );

    //json parsed data are stored in weatherData var
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
