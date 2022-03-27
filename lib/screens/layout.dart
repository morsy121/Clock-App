import 'package:clockapp/screens/alarm_screen.dart';
import 'package:clockapp/screens/clock_screen.dart';
import 'package:clockapp/screens/stopwatch_screen.dart';
import 'package:clockapp/screens/timer_screen.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal,
          title: const Text("Clock App"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Image.asset(
                  'assets/icons/world_icon.png',
                  height: 30,
                ),
                child: const Text('Clock'),
              ),
              Tab(
                icon: Image.asset(
                  'assets/icons/alarm_clock.png',
                  height: 30,
                ),
                child: const Text('Alarm'),
              ),
              Tab(
                icon: Image.asset(
                  'assets/icons/timer_icon.png',
                  height: 30,
                ),
                child: const Text('Timer'),
              ),
              Tab(
                icon: Image.asset(
                  'assets/icons/stopwatch_icon.png',
                  height: 30,
                ),
                child: const Text('StoWatch'),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          ClockScreen(),
          AlarmScreen(),
          TimerScreen(),
          StopWatchScreen(),
        ]),
      ),
    );
  }
}
