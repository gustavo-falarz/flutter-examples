import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  final Weather locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel model = WeatherModel();
  int temperature;
  String city;
  String weatherIcon;
  String weatherMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      updateLocation();
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      pickCity();
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon ',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $city',
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

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateLocation() async {
    Position position = await Location.getLocation();
    Weather weather =
        await HttpService.getWeather(position.latitude, position.longitude);

    updateUi(weather);
  }

  void updateCity(String cityName) async {
    Weather weather = await HttpService.getWeatherByCity(cityName);
    updateUi(weather);
  }

  void updateUi(Weather weather) {
    setState(() {
      temperature = weather.temperature;
      int condition = weather.condition;
      weatherIcon = model.getWeatherIcon(condition);
      weatherMessage = model.getMessage(temperature);
      city = weather.city;
    });
  }

  void pickCity() async {
    String cityName =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CityScreen();
    }));
    if (cityName != null) {
      updateCity(cityName);
    }
  }
}
