import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';
import 'package:task_list/data/data.dart';

class DisplayCAt extends StatefulWidget {
  const DisplayCAt({super.key});

  @override
  State<DisplayCAt> createState() => _DisplayCAtState();
}

class _DisplayCAtState extends State<DisplayCAt> {
  final listImages = [
    "lib/images/work.jpg",
    "lib/images/education.jpg",
    "lib/images/entertament.jpg",
    "lib/images/others.png"
  ];

  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(milliseconds: 1100), (Timer timer) {
      if (_currentPage < listImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<DataCubit>();
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      width: screenWidth * 0.7,
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: listCat.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              cubit.changeSelCategory(listCat[index]);
              Navigator.pushNamed(context, "/displaycate");
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    listImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, st) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Center(
                      child: Text(
                        listCat[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
