import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/data_cubit.dart';

class WeekPage extends StatelessWidget {
  const WeekPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    var cubit = context.read<DataCubit>();
    return BlocConsumer<DataCubit, DataState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(backgroundColor: const Color(0xff331C71)),
          backgroundColor: const Color(0xff331C71),
          body: SafeArea(
              child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                        color: const Color(0xff5842A9),
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  const Image(
                                      height: 200,
                                      image:
                                          AssetImage("lib/images/sunny.png")),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 100, left: 60),
                                    child: Text(
                                      "${cubit.model?.forecast!.forecastday![1].day?.avgtemp!.toInt()}°",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 100,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Tomorrow",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    cubit.model?.forecast!.forecastday![1].day!
                                            .condition!.text ??
                                        'not founded',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Image(
                                    height: screenHeight * 0.05,
                                    image:
                                        const AssetImage("lib/images/drop.png"),
                                  ),
                                  Text(
                                    "${cubit.model?.forecast?.forecastday?[1].day!.avghumidity ?? 0}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    "Humidity",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image(
                                    height: screenHeight * 0.05,
                                    image:
                                        const AssetImage("lib/images/wind.png"),
                                  ),
                                  Text(
                                    "${cubit.model?.forecast?.forecastday?[0].day!.maxwindK ?? 0}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    "Wind KP/H",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SafeArea(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cubit.week.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${cubit.week[index]}",
                                    style:
                                        const TextStyle(color: Colors.white)),
                                const Image(
                                    height: 50,
                                    image: AssetImage("lib/images/sunny.png")),
                                Text(
                                  "${cubit.model?.forecast!.forecastday![index + 1].day?.condition!.text}",
                                ),
                                Text(
                                    "${cubit.model?.forecast!.forecastday![index + 1].day?.avgtemp!.toInt()}°",
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
