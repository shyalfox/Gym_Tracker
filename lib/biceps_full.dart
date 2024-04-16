import 'package:flutter/material.dart';
import 'package:gym_counter/excercise_list_bicep.dart';

class BicepsFull extends StatefulWidget {
  const BicepsFull({super.key});

  @override
  State<BicepsFull> createState() => _BicepsFull();
}

class _BicepsFull extends State<BicepsFull> {
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
                'Bicep',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  ExerciseCard(
                    exerId: 1,
                    partBody: 'Bicep',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 2,
                    partBody: 'Bicep',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 3,
                    partBody: 'Bicep',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 4,
                    partBody: 'Bicep',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 5,
                    partBody: 'Bicep',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 6,
                    partBody: 'Bicep',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 7,
                    partBody: 'Bicep',
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
