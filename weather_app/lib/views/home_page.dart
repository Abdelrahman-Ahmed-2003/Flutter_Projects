import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: const Color(0xff331C71),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Weather App",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    height: 40,
                    width: 40,
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Mostly Sunny",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Stack(
                children: [
                  Text(
                    "25°",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 150,
                        fontWeight: FontWeight.bold),
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Padding(
                        padding: EdgeInsets.only(left: 50, top: 80),
                        child: Image(
                            height: 150,
                            image: AssetImage("lib/images/sunny.png"))),
                  ),
                ],
              ),
              const Text("10feb2024"),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                          color: const Color(0xff331C71),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 14, left: 8),
                            child: Column(
                              children: [
                                Image(
                                  height: 40,
                                  image:
                                      AssetImage("lib/images/protection.png"),
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
                                  image:
                                      AssetImage("lib/images/protection.png"),
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
                                  image:
                                      AssetImage("lib/images/protection.png"),
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(const Color.fromARGB(255, 33, 75, 243)),
                      ),
                      onPressed: () {},
                      child: const Text("Today",
                          style: TextStyle(color: Colors.white))),
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromARGB(255, 91, 131, 116)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/WeekPage');
                      },
                      child: const Text("7-Day Forcasts",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 120,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: const EdgeInsets.only(right: 15.0),
                              height: 120,
                              width: 80,
                              decoration: BoxDecoration(
                                color: const Color(0xff331C71),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("10:00 AM"),
                                  Image(
                                      height: 50,
                                      image:
                                          AssetImage("lib/images/sunny.png")),
                                  Text("10"),
                                ],
                              ));
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
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
  }
}
