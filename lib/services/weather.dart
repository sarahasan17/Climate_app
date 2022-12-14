import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'package:clima/screens/city_screen.dart';

const apikey = '66b44d26adf33fe7fbc3cf6fd3e136b3';

class WeatherModel {
  Future<dynamic> getCityweather(String cityName) async {
    Networkhelper networkhelper = Networkhelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=matric');
    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  Future<dynamic> getLocationdata() async {
    Location location = Location();
    await location.getCurrentLocation();
    Networkhelper networking = Networkhelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitute}&lon=${location.longitude}&APPID=$apikey&unit=matric');
    var weatherdata = await networking.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
