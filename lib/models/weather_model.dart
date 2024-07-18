class WeatherModel {
  final String localtime;
  final double maxTemp;
  final double minTemp;
  final double temp;
  final String condition;
  final String location;
  final String country;
  final String icon;

  WeatherModel(
      {required this.country,
      required this.icon,
      required this.location,
      required this.localtime,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.condition});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final Map day = json["forecast"]["forecastday"][0]["day"];
    final Map location = json["location"];
    final List<String> icon = day["condition"]["icon"].split('/');

    return WeatherModel(
      location: location["name"],
      country: location["country"],
      localtime: location["localtime"] ?? 'error parsing time',
      maxTemp: day["maxtemp_c"] ?? 0,
      minTemp: day["mintemp_c"] ?? 0,
      temp: day["avgtemp_c"] ?? 0,
      condition: day["condition"]["text"] ?? 'no condition',
      icon: '${icon[icon.length - 2]}/${icon.last}',
    );
  }

  @override
  String toString() {
    return '{localtime:$localtime, temp:$temp, maxTemp:$maxTemp, minTemp:$minTemp, condition:$condition}';
  }
}
