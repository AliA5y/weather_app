import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/empty_weather_widget.dart';
import 'package:weather_app/widgets/loading_widget.dart';
import 'package:weather_app/widgets/weather_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherModel? weather = Provider.of<WeatherProvider>(context).weatherData;

    return (weather?.location == null)
        ? const EmptyWeatherWidget()
        : (weather == null)
            ? const LoadingWidget()
            : WeatherWidget(
                weatherModel: weather,
              );
  }
}
