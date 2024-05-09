import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/views/home_page.dart';

class WeekPage extends StatelessWidget {
  const WeekPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            children: [
              
              Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      color: const Color(0xff5842A9),
                      borderRadius: BorderRadius.circular(16)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20,bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Image(
                                    height: 200,
                                    image:
                                        AssetImage("lib/images/sunny.png")),
                                Padding(
                                  padding: EdgeInsets.only(top: 100, left: 60),
                                  child: Text(
                                    "25°",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 100,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Tomorrow",
                                  style: TextStyle(
                                      color: Colors.white,),
                                ),
                                Text(
                                  "Sunny",
                                  style: TextStyle(
                                      color: Colors.white,),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
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
                          Column(
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
                          Column(
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
                          
                        ],
                        )
                      ],
                    ),
                  ),
                  
                  ),
              const SizedBox(height: 20),
              Expanded(
                child: SafeArea(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                          children: [Text("Mondey", style: TextStyle(color: Colors.white)),
                          Image(
                              height: 50,
                              image:
                                  AssetImage("lib/images/sunny.png")),
                          Text("Sunny"),
                          Text("25°", style: TextStyle(color: Colors.white)),
                          Text("10", style: TextStyle(color: Colors.white))]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
