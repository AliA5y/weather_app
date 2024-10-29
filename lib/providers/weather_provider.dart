import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:weather_app/errors/custom_exceptions.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? _location;
  Timer? _snackBarTimer;

  String? get location => _location;
  set location(String? location) {
    _location = location;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
  set weatherData(WeatherModel? data) {
    _weatherData = data;
    notifyListeners();
  }

  Future<void> requestWeather(BuildContext context, String? location) async {
    showLoading(context);
    Future(() async {
      WeatherModel? weather;
      try {
        weather = await _fetchWeather(location);
      } on InvalidLocationException catch (e) {
        if (context.mounted) {
          showWeatherFetchingFailureSnackBar(context, location, e.message);
        }
      } on SocketException {
        if (context.mounted) {
          showWeatherFetchingFailureSnackBar(context, location,
              'Network Error, check your connection and retry.');
        }
      } on Exception catch (e) {
        if (context.mounted) {
          showWeatherFetchingFailureSnackBar(
              context, location, e.toString().split(':').first);
        }
      }
      return weather;
    }).then((fetchedWeatherData) {
      Navigator.pop(context);

      if (fetchedWeatherData != null) {
        weatherData = fetchedWeatherData;
        Navigator.pop(context);
      } else {
        //   showWeatherFetchingFailureSnackBar(
        //     context,
        //     location,
        //     'Unknown Error, no weather data returned',
        //   );
      }
    });
  }

  Future<WeatherModel?> _fetchWeather(String? location) async {
    WeatherService service = WeatherService();
    return await service.getWeather(location);
  }

  Future<void> showLoading(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  showWeatherFetchingFailureSnackBar(
      BuildContext context, String? location, String error) {
    _snackBarTimer?.cancel();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[500],
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 64),
        content: Text(error, style: const TextStyle(color: Colors.white)),
        action: SnackBarAction(
            textColor: Colors.white,
            label: 'Retry',
            onPressed: () {
              requestWeather(context, location);
            }),
      ),
    );
    _snackBarTimer = Timer(const Duration(seconds: 4), () {
      ScaffoldMessenger.of(context).clearSnackBars();
    });
  }

  void disposeSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    _snackBarTimer?.cancel();
  }

  MaterialColor getThemeColor() {
    final condition = weatherData?.condition.toLowerCase();
    if (condition == null) {
      return Colors.blue;
    } else {
      if (condition.contains('sunny') || condition.contains('clear')) {
        return Colors.amber;
      } else if (condition.contains('cloudy') ||
          condition.contains('mist') ||
          condition.contains('overcast') ||
          condition.contains('fog') ||
          condition.contains('thundery') ||
          condition.contains('thunder')) {
        return Colors.blueGrey;
      } else if (condition.contains('rain') ||
          condition.contains('sleet') ||
          condition.contains('snow') ||
          condition.contains('drizzle') ||
          condition.contains('ice') ||
          condition.contains('blizzard')) {
        return Colors.blue;
      } else {
        return Colors.blue;
      }
    }
  }
}

extension ContextExtention on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}
