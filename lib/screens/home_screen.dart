import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/screens/search_screen.dart';
import 'package:weather/widgets/empty_weather_widget.dart';
import 'package:weather/widgets/loading_widget.dart';
import 'package:weather/widgets/weather_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String id = 'home';

  @override
  Widget build(BuildContext context) {
    WeatherModel? weather = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('weather'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.id);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: (weather?.location == null)
            ? const EmptyWeatherWidget()
            : (weather == null)
                ? const LoadingWidget()
                : WeatherWidget(
                    weatherModel: weather,
                  ),
      ),
    );
  }
}
