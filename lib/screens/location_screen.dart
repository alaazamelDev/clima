import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, this.weatherData}) : super(key: key);

  final weatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final WeatherModel model = WeatherModel();
  late int temperature;
  late String cityName;
  late String weatherIcon;
  late String weatherMessage;

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        cityName = '';
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
      } else {
        //parse data and extract weather data
        double temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        weatherIcon = model.getWeatherIcon(weatherData['weather'][0]['id']);
        cityName = weatherData['name'];
        weatherMessage = model.getMessage(temperature);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () async {
                      //update data for current location
                      updateUI(await model.getLocationWeather());
                    },
                    child: Icon(
                      Icons.near_me,
                      size: ScreenUtil().setHeight(50),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CityScreen(),
                        ),
                      );
                      if (typedName != null) {
                        var cityWeatherData =
                            await WeatherModel().getCityWeather(typedName);
                        updateUI(cityWeatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: ScreenUtil().setHeight(50),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: ScreenUtil().setWidth(15)),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
