import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/Cubites/get_currentWeather_cubit/get_weather_cubit.dart';
import 'package:wheather_app/Cubites/get_currentWeather_cubit/get_weather_state.dart';
import 'package:wheather_app/main.dart';
import 'package:wheather_app/models/wheather_model.dart';
import 'package:wheather_app/views/search_view.dart';
import 'package:wheather_app/widgets/no_weather_body.dart';
import 'package:wheather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body:
          BlocBuilder<GetWeaterCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherIntialState) {
          return NoWeatherBody();
        } else if (state is WeatherLoadedState) {
          return WeatherInfoBody(
            weather: state.weathermodel,
          );
        } else {
          return const Text('oops ,there was an error');
        }
      }),
    );
  }
}
