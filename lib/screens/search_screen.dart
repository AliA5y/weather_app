import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

import '../widgets/search_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const String id = 'search';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        Provider.of<WeatherProvider>(context, listen: false)
            .disposeSnackBar(context);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchTextField(),
          ),
        ),
      ),
    );
  }
}
