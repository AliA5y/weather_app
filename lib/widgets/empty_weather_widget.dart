import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/screens/search_screen.dart';

class EmptyWeatherWidget extends StatelessWidget {
  const EmptyWeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(flex: 3),
        const Text(
          'Search weather of a city',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 30),
        MaterialButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 18),
          onPressed: () {
            Navigator.pushNamed(context, SearchScreen.id);
          },
          color: Provider.of<WeatherProvider>(context).getThemeColor(),
          child: const Text(
            'Search',
            style: TextStyle(
              fontSize: 21,
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(flex: 5),
      ],
    );
  }
}
