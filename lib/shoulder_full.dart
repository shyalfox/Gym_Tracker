import 'package:flutter/material.dart';
import 'package:gym_counter/excercise_list_shoulder.dart';

class ShouldersFull extends StatefulWidget {
  const ShouldersFull({super.key});

  @override
  State<ShouldersFull> createState() => _ShouldersFull();
}

class _ShouldersFull extends State<ShouldersFull> {
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
                'Shoulder',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  ExerciseCard(
                    exerId: 1,
                    partBody: 'Shoulder',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 2,
                    partBody: 'Shoulder',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 3,
                    partBody: 'Shoulder',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 4,
                    partBody: 'Shoulder',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 5,
                    partBody: 'Shoulder',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 6,
                    partBody: 'Shoulder',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 7,
                    partBody: 'Shoulder',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 8,
                    partBody: 'Shoulder',
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
