import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class CityViewWidget extends StatelessWidget {
  const CityViewWidget({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weatherModel.location,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 34),
        ),
        const SizedBox(height: 6),
        Text(
          weatherModel.country,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 6),
        Text(
          'Updated at: ${weatherModel.localtime.substring(11)}',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
