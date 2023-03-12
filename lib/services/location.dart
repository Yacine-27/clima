import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

Future<Position> getCurrentLocation() async {
  try {
    await Geolocator.requestPermission();
    Position p = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    return p;
  } catch (e) {
    return e;
  }
}

Future getData(double latitude, double longitude) async {
  const String weatherApiKey = '1a33bcec627a756a0f3474ea4b69fac4';
  http.Response response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${weatherApiKey}&units=metric'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else
    print(response.statusCode);
}

Future getCityWeather(String cityName) async {
  const String weatherApiKey = '1a33bcec627a756a0f3474ea4b69fac4';
  http.Response response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${weatherApiKey}&units=metric'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else
    print(response.statusCode);
}
