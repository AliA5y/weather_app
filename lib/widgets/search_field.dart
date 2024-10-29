import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    String? location = Provider.of<WeatherProvider>(context).location;
    return TextField(
      onChanged: (value) {
        Provider.of<WeatherProvider>(context, listen: false).location = value;
      },
      decoration: InputDecoration(
          suffix: IconButton(
              color: Colors.teal,
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (location == null || location.length < 3) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      margin: EdgeInsets.only(left: 24, right: 24, bottom: 100),
                      behavior: SnackBarBehavior.floating,
                      content: Text('Enter a valid location name and retry'),
                    ),
                  );
                } else {
                  weatherProvider.requestWeather(context, location);
                }
              },
              icon: const Icon(Icons.search)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          label: const Text('search a location'),
          hintText: 'Enter a location name to search',
          border: const OutlineInputBorder()),
    );
  }
}
