import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_list/cubits/cubit/cubit_category.dart';
import 'package:task_list/cubits/cubit/data_cubit.dart';

class DisplayCAt extends StatelessWidget {
  const DisplayCAt({super.key});

  @override
  Widget build(BuildContext context) {
    var listCat = context.read<CategoryCubit>().categories;
    var cubit = context.read<DataCubit>();
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      width: screenWidth * 0.9,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listCat.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              cubit.category = listCat[index];
              Navigator.pushNamed(context, "/displaycate");
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 150, // Adjust this for your item width
              /*decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("lib/images/work.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black54, width: 1),
              ),*/
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "lib/images/photo.png",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, st) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 50.0,
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
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
