import 'package:flutter/material.dart';
import 'package:geo_weather/screens/weather_update_screen.dart';
import 'package:geo_weather/services/weather_data.dart';

const openMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '77f0715a8076b709ab48743bff39b13f';

class CityScreen extends StatefulWidget {
  //const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName, url;

  void getWeatherData() async {
    url = '$openMapUrl?q=$cityName&appid=$apiKey&units=metric';
    WeatherData weatherData = WeatherData(url: url);
    String data = await weatherData.getData();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => UpdateScreen(data: data)));
  }

  showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("City Name Empty"),
          content:
              Text("You don't write any city name. please write city name"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  cityName = value;
                });
              },
              decoration: InputDecoration(
                  icon: Icon(Icons.location_city), hintText: 'Type city name'),
            ),
            SizedBox(
              height: 10.0,
            ),
            OutlinedButton(
                onPressed: () {
                  if (cityName == null) {
                    showErrorDialog(context);
                  } else {
                    getWeatherData();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Search',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
