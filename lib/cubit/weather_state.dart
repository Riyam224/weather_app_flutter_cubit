// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  WeatherModel weatherModel;
  WeatherSuccessState({
    required this.weatherModel,
  });
}

class WeatherFailedState extends WeatherState {}
