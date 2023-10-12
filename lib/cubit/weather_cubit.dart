import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherService weatherService;
  String? cityName;
  WeatherModel? weatherModel;
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      WeatherModel weatherModel =
          await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel: weatherModel));
    } catch (e) {
      print(e);
      emit(WeatherFailedState());
    }
  }
}
