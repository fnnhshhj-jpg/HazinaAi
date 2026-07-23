import 'dart:convert';

class Weather {
  final String city;
  final String country;

  final double temperature;
  final double feelsLike;

  final double minTemperature;
  final double maxTemperature;

  final int humidity;
  final int pressure;

  final double windSpeed;

  final String condition;
  final String description;
  final String icon;

  final DateTime dateTime;

  const Weather({
    required this.city,
    required this.country,
    required this.temperature,
    required this.feelsLike,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.condition,
    required this.description,
    required this.icon,
    required this.dateTime,
  });

  factory Weather.empty() {
    return Weather(
      city: "",
      country: "",
      temperature: 0,
      feelsLike: 0,
      minTemperature: 0,
      maxTemperature: 0,
      humidity: 0,
      pressure: 0,
      windSpeed: 0,
      condition: "",
      description: "",
      icon: "",
      dateTime: DateTime.now(),
    );
  }

  Weather copyWith({
    String? city,
    String? country,
    double? temperature,
    double? feelsLike,
    double? minTemperature,
    double? maxTemperature,
    int? humidity,
    int? pressure,
    double? windSpeed,
    String? condition,
    String? description,
    String? icon,
    DateTime? dateTime,
  }) {
    return Weather(
      city: city ?? this.city,
      country: country ?? this.country,
      temperature: temperature ?? this.temperature,
      feelsLike: feelsLike ?? this.feelsLike,
      minTemperature: minTemperature ?? this.minTemperature,
      maxTemperature: maxTemperature ?? this.maxTemperature,
      humidity: humidity ?? this.humidity,
      pressure: pressure ?? this.pressure,
      windSpeed: windSpeed ?? this.windSpeed,
      condition: condition ?? this.condition,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "city": city,
      "country": country,
      "temperature": temperature,
      "feelsLike": feelsLike,
      "minTemperature": minTemperature,
      "maxTemperature": maxTemperature,
      "humidity": humidity,
      "pressure": pressure,
      "windSpeed": windSpeed,
      "condition": condition,
      "description": description,
      "icon": icon,
      "dateTime": dateTime.toIso8601String(),
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {