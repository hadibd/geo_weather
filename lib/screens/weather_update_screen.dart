import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geo_weather/screens/services/model.dart';
import 'package:intl/intl.dart';

import 'city_screen.dart';

class UpdateScreen extends StatefulWidget {
  // const UpdateScreen({Key? key}) : super(key: key);

  UpdateScreen({this.data});
  final String data;

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  var city, id, country;
  var heading, msg;
  int temp, realTemp, tempMax, tempMin, humidity, wind;
  String wIcon, status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.data);
  }

  updateUI(dynamic data) {
    try {
      var decodedData = jsonDecode(data);
      city = decodedData['name'];
      country = decodedData['sys']['country'];
      id = decodedData['weather'][0]['id'];
      double temperature = decodedData['main']['temp'];
      temp = temperature.round();
      double realTemperature = decodedData['main']['feels_like'];
      realTemp = realTemperature.round();
      double maxTemp = decodedData['main']['temp_max'];
      tempMax = maxTemp.round();
      double minTemp = decodedData['main']['temp_min'];
      tempMin = minTemp.round();
      humidity = decodedData['main']['humidity'];
      double dWind = decodedData['wind']['speed'];
      wind = dWind.round();
      Model model = Model();
      wIcon = model.weatherIcon(id);
      status = model.weatherMsg(id);
    } catch (e) {
      print(e);
      var decodedData = jsonDecode(data);
      heading = decodedData['cod'];
      msg = decodedData['message'];
      print(heading);
      print(msg);
      city = '';
      id = '';
      temp = 0;
      realTemp = 0;
      tempMax = 0;
      tempMin = 0;
      humidity = 0;
      wind = 0;
      wIcon = '0';
      status = '0';
      cityErrorDialog(context);
    }
  }

  cityErrorDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(heading),
            content: Text(msg),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TextStyle cityTextStyle;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMMd('en_US').format(now); // 28/03/2020
    String formattedDay = DateFormat.EEEE().format(now); // 28/03/2020
    print(formattedDay);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Geo Weather'),
        actions: [
          GestureDetector(
            onTap: () async {
              String cityName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CityScreen()));
              print(cityName);
            },
            child: Icon(
              Icons.location_city,
              size: 30.0,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/bg.jpg'),
              colorBlendMode: BlendMode.darken,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    city + ", " + country,
                    style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    formattedDay + ", " + formattedDate,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Text(
                    temp.toString() + "°C",
                    style: TextStyle(
                        fontSize: 65.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Real Feels " + realTemp.toString() + "°C",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25.0,
                    width: 100.0,
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  ImageIcon(
                    AssetImage(wIcon),
                    size: 75.0,
                    color: Colors.white,
                  ),
                  Text(
                    status,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    tempMin.toString() + "°C / " + tempMax.toString() + "°C",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'HUMIDITY',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(humidity.toString() + "%",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Column(
                        children: [
                          Text(
                            'WIND',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(wind.toString() + " m/s",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
