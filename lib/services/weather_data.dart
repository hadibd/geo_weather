import 'package:http/http.dart' as http;

class WeatherData {
  String url;
  WeatherData({this.url});

  Future<String> getData() async {
    String data;
    var pUrl = Uri.parse(url);
    var response = await http.get(pUrl);
    if (response.statusCode == 200) {
      data = response.body;
    } else {
      print(response.statusCode);
    }
    return data;
  }

  Future<String> getDataByCity() async {
    String data;
    var pUrl = Uri.parse(url);
    var response = await http.get(pUrl);
    if (response.statusCode == 200) {
      data = response.body;
    } else {
      print(response.statusCode);
    }
    return data;
  }
}
