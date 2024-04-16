import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym_counter/back_full.dart';
import 'package:gym_counter/biceps_full.dart';
import 'package:gym_counter/chest_full.dart';
import 'package:gym_counter/legs_full.dart';
import 'package:gym_counter/shoulder_full.dart';
import 'package:gym_counter/tricpes_full.dart';
import 'timer.dart';

class ExcerciseMenu extends StatelessWidget {
  const ExcerciseMenu({
    super.key,
    required this.excerciseName,
    required this.excerciseCour,
    required this.listcounter,
  });
  final String excerciseName;
  final String excerciseCour;
  final int listcounter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (kDebugMode) {
            print('clicked');
          }
          if (listcounter == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChestFull(),
              ),
            );
          } else if (listcounter == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TricepFull(),
              ),
            );
          } else if (listcounter == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BackFull(),
              ),
            );
          } else if (listcounter == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BicepsFull(),
              ),
            );
          } else if (listcounter == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ShouldersFull(),
              ),
            );
          } else if (listcounter == 6) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LegssFull(),
              ),
            );
          } else if (listcounter == 7) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TimerPage(),
              ),
            );
          }
        },
        child: Card(
          elevation: 10,
          child: SizedBox(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    excerciseName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                    ),
                  ),
                  Text(
                    excerciseCour,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
