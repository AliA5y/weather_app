import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/city_view_widget.dart';
import 'package:weather_app/widgets/temperature_view_widget.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final MaterialColor color =
        Provider.of<WeatherProvider>(context, listen: false).getThemeColor();
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            color[400]!,
            color[200]!,
            color[50]!,
          ])),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            CityViewWidget(weatherModel: weatherModel),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            TemperatureViewWidget(weatherModel: weatherModel),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Text(weatherModel.condition, style: const TextStyle(fontSize: 40)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          ],
        ),
      ),
    );
  }
}
