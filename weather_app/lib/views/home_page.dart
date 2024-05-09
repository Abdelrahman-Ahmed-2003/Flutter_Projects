import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/data_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
    var cubit = context.read<DataCubit>();

    cubit.getLocation().then((value) {
      cubit.getWeather();
    });
  }

  String editTime(String time) {
    List<String> dateTimeParts = time.split(" ");
    List<String> timeParts = dateTimeParts[1].split(":");
    return timeParts[0];
  }

  String checkTime(hours) {
    int hourNow = TimeOfDay.now().hour;
    for (int i = 0; i < hours.length; ++i) {
      if (int.parse(editTime(hours[i].time)) == hourNow) {
        return hours[i].condition.text;
      }
    }
    return "No";
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<DataCubit, DataState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<DataCubit>();
        if (cubit.position == null) {
          return const Scaffold(
            backgroundColor: Color(0xff5842A9),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        
        if (cubit.model == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          backgroundColor: const Color(0xff5842A9),
          body: SafeArea(
              child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Weather App",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Container(
                        height: screenHeight * 0.05,
                        width: screenWidth * 0.1,
                        decoration: BoxDecoration(
                            color: const Color(0xff331C71),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  Text(
                    checkTime(cubit.model?.forecast!.forecastday![0].hour!),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Stack(
                    children: [
                      Text(
                        "${cubit.model?.forecast!.forecastday![0].hour![0].tempC?.toInt()}°",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.bold),
                      ),
                      Opacity(
                        opacity: 0.7,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 25, top: screenHeight * 0.030),
                            child: Image(
                                height: screenHeight / 7,
                                image:
                                    const AssetImage("lib/images/sunny.png"))),
                      ),
                    ],
                  ),
                  const Text("10feb2024"),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    children: [
                      Container(
                          height: screenHeight * 0.15,
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                              color: const Color(0xff331C71),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight * 0.025, left: 8),
                                child: Column(
                                  children: [
                                    Image(
                                      height: screenHeight * 0.05,
                                      image: AssetImage(
                                          "lib/images/protection.png"),
                                    ),
                                    Text(
                                      "12km/h",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Protection",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight * 0.025, left: 8),
                                child: Column(
                                  children: [
                                    Image(
                                      height: screenHeight * 0.05,
                                      image: AssetImage(
                                          "lib/images/protection.png"),
                                    ),
                                    Text(
                                      "12km/h",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Protection",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 14, left: 8),
                                child: Column(
                                  children: [
                                    Image(
                                      height: 40,
                                      image: AssetImage(
                                          "lib/images/protection.png"),
                                    ),
                                    Text(
                                      "12km/h",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Protection",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 33, 75, 243)),
                          ),
                          onPressed: () {},
                          child: const Text("Today",
                              style: TextStyle(color: Colors.white))),
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 91, 131, 116)),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/WeekPage');
                          },
                          child: const Text("7-Day Forcasts",
                              style: TextStyle(color: Colors.white))),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  SizedBox(
                    height: screenHeight * 0.18,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 24,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  margin: const EdgeInsets.only(right: 15.0),
                                  height: screenHeight * 0.2,
                                  width: screenWidth * 0.18,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff331C71),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                          editTime(cubit.model?.forecast!.forecastday![0].hour![index].time ?? '0')),
                                      const Image(
                                          height: 50,
                                          image: AssetImage(
                                              "lib/images/sunny.png")),
                                      Text(
                                          '${cubit.model?.forecast!.forecastday![0].hour![index].tempC!.toInt() ?? 0}°'),
                                    ],
                                  ));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      "Other Cities",
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
