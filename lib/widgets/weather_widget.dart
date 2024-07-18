import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/widgets/city_view_widget.dart';
import 'package:weather/widgets/temperature_view_widget.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final color =
        Provider.of<WeatherProvider>(context, listen: false).getThemeColor();
    return Container(
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
      child: Column(
        children: [
          const Spacer(flex: 3),
          CityViewWidget(weatherModel: weatherModel),
          const Spacer(flex: 2),
          TemperatureViewWidget(weatherModel: weatherModel),
          const Spacer(flex: 2),
          Text(weatherModel.condition, style: const TextStyle(fontSize: 40)),
          const Spacer(flex: 6),
        ],
      ),
    );
  }
}
