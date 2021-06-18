import 'package:flutter/material.dart';
import 'package:geo_weather/screens/weather_update_screen.dart';
import 'package:geo_weather/services/location.dart';
import 'package:geo_weather/services/weather_data.dart';
import 'package:loading_indicator/loading_indicator.dart';

const openMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '77f0715a8076b709ab48743bff39b13f';

class LoadingScreen extends StatefulWidget {
  //const LoadingScreen({Key? key}) : super(key: key);
  LoadingScreen({this.cityName});
  final String cityName;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String latitude, longitude, url;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentLocation();
  }

  void getCurrentLocation() async {
    Location cLocation = Location();
    await cLocation.getLocation();
    latitude = cLocation.cLatitude.toString();
    longitude = cLocation.cLongitude.toString();
    url = '$openMapUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    getWeatherData();
  }

  void getWeatherData() async {
    WeatherData weatherData = WeatherData(url: url);
    String data = await weatherData.getData();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => UpdateScreen(data: data)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: LoadingIndicator(
            indicatorType: Indicator.ballScaleMultiple,
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}
