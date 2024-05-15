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

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<DataCubit>();

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: listCat.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(5, 4),
                  blurRadius: 4,
                )
              ],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/displaycate");
                Future.delayed(const Duration(milliseconds: 10), () {
                  cubit.changeSelCategory(listCat[index]);
                });
                
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                      ),
                      child: Image.asset(
                        listImages[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, st) {
                          return const Icon(Icons.error);
                        },
                      ),
                    ),
                  ),
                  Text(
                    listCat[index],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}
