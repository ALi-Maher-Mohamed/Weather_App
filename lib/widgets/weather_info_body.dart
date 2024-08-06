import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/Cubites/get_currentWeather_cubit/get_weather_cubit.dart';
import 'package:wheather_app/main.dart';
import 'package:wheather_app/models/wheather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);
  final wheatherModel weather;
  @override
  Widget build(BuildContext context) {
    wheatherModel weathermodel =
        BlocProvider.of<GetWeaterCubit>(context).weathermodel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                getThemeColor(weathermodel.wheatherStatus),
                getThemeColor(weathermodel.wheatherStatus)[300]!,
                getThemeColor(weathermodel.wheatherStatus)[50]!
                ],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weathermodel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'Updated at ${weathermodel.date.hour}:${weathermodel.date.minute}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:' + weathermodel.image!,
                ),
                Text(
                  '${weathermodel.temp}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'MaxTemp: ' + weathermodel.maxTemp.round().toString(),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'MinTemp: ${weathermodel.minTemp.round()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              '${weathermodel.wheatherStatus}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
