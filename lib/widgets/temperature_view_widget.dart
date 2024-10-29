import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class TemperatureViewWidget extends StatelessWidget {
  const TemperatureViewWidget({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/${weatherModel.icon}'),
        Text(
          '${weatherModel.temp}',
          style: const TextStyle(fontSize: 28),
        ),
        Column(
          children: [
            Text(
              'Max Temp: ${weatherModel.maxTemp}',
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              'Min Temp: ${weatherModel.minTemp}',
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }
}
