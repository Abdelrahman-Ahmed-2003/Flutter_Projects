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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
              const Text(
                "Mostly Sunny",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Stack(
                children: [
                  Text(
                    "25°",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.bold),
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Padding(
                        padding: EdgeInsets.only(left: 20, top: screenHeight * 0.028),
                        child: Image(
                            height: screenHeight/7,
                            image: AssetImage("lib/images/sunny.png"))),
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
                            padding: EdgeInsets.only(top: screenHeight*0.025, left: 8),
                            child: Column(
                              children: [
                                Image(
                                  height: screenHeight*0.05,
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
                            padding: EdgeInsets.only(top: screenHeight*0.025, left: 8),
                            child: Column(
                              children: [
                                Image(
                                  height: screenHeight*0.05,
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
                            Color.fromARGB(255, 91, 131, 116)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/WeekPage');
                      },
                      child: const Text("7-Day Forcasts",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              Container(
                height: screenHeight * 0.18,
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
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.18,
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
  }
}
