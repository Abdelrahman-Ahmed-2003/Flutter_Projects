import 'package:flutter/material.dart';
import 'package:task_list/pages/category.dart';
import 'package:task_list/pages/display_tasks.dart';

class MianPage extends StatefulWidget {
  const MianPage({super.key});

  @override
  State<MianPage> createState() => _MianPageState();
}

class _MianPageState extends State<MianPage> {
  void _onpressedCalendar() {
    Navigator.pushNamed(context, '/calendar');
  }

  double pad = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: Colors.white)),
        onPressed: () {
          Navigator.pushNamed(context, '/addtask');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomAppBar(
        height: 50,
        color: Color.fromARGB(72, 34, 219, 92),
        notchMargin: 3.0,
        shape: CircularNotchedRectangle(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Column(
          children: [
            Text(
              "Hi Abdo",
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: _onpressedCalendar,
              icon: const Icon(Icons.calendar_month)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        color: Colors.blue,
        child: Column(
          children: [
            const DisplayCAt(),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: const Text(
                "Today",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const DisplayTask(),
          ],
        ),
      ),
    );
  }
}
