import 'package:flutter/material.dart';
import 'package:weather_app/location/current_location.dart';
import 'package:weather_app/model/model.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// create _HomePageState class extends State<HomePage>

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: determinePosition(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return FutureBuilder(
            future: WeatherApi().fetch(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }else {
                Model model = snapshot.data!;
                print(model.location!.name!);
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.blue,
                  ),
                  body: Container(
                    color: Colors.blue,
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(model.location!.country!, style: const TextStyle(fontSize: 25, color: Colors.white),),
                        Text("${model.location!.region!}, ${model.location!.name!}",style: const TextStyle(color: Colors.white),),  
                        const Spacer(),
                        Text("${model.current!.tempC!.toInt()}°", style: const TextStyle(fontSize: 80, color: Colors.white),),
                        const Row(children: [
                          Text("Sunrise",style: TextStyle(color: Colors.white),),
                          Spacer(),
                          Text("Sunset",style: TextStyle(color: Colors.white),),
                        ],),
                        Image.network("https://www.bing.com/images/search?view=detailV2&ccid=vQxaKKSc&id=DE1E34C7BA5D05F792960C69ABB0A8C8E2DF18E6&thid=OIP.vQxaKKScLBawrLxEC7y2iwHaJ4&mediaurl=https%3a%2f%2fclipground.com%2fimages%2fbut-sunny-clipart-14.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.bd0c5a28a49c2c16b0acbc440bbcb68b%3frik%3d5hjf4siosKtpDA%26pid%3dImgRaw%26r%3d0&exph=1032&expw=774&q=background+animated+images+weather+is+sunnty&simid=608032018245100724&FORM=IRPRST&ck=6E9E0E7A86EE01D57AD783F6C626D0EA&selectedIndex=15&itb=0"),
                        Row(children: [
                          Text(model.forecast!.forecastday![0].astro!.sunrise!, style: const TextStyle(color: Colors.white),),
                          const Spacer(),
                          Text(model.forecast!.forecastday![0].astro!.sunset!, style: const TextStyle(color: Colors.white),),
                        ],),
                        const Spacer(),

                        ],
                    ),
                  ),
                );
              }
            },
          );
        }
      },
    );
  }
}
