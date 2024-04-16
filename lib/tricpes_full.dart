import 'package:flutter/material.dart';
import 'package:gym_counter/excercise_list_triceps.dart';

class TricepFull extends StatefulWidget {
  const TricepFull({super.key});

  @override
  State<TricepFull> createState() => _TricepFullState();
}

class _TricepFullState extends State<TricepFull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Tracker'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Tricep',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  ExerciseCard(
                    exerId: 1,
                    partBody: 'Tricep',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 2,
                    partBody: 'Tricep',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 3,
                    partBody: 'Tricep',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 4,
                    partBody: 'Tricep',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 5,
                    partBody: 'Tricep',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 6,
                    partBody: 'Tricep',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 7,
                    partBody: 'Tricep',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
