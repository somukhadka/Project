import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:weatherapp/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationweather: weatherData, );
      }
      ) );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SpinKitDoubleBounce(
          size: 100.0,
          color: Colors.white,
          duration: const Duration(milliseconds: 1000),
        ), 
        ),
    );
  }
}

 