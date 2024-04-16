import 'package:flutter/material.dart';
import 'package:gym_counter/excercise_list_legs.dart';

class LegssFull extends StatefulWidget {
  const LegssFull({super.key});

  @override
  State<LegssFull> createState() => _LegssFull();
}

class _LegssFull extends State<LegssFull> {
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
                'Legs',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  ExerciseCard(
                    exerId: 1,
                    partBody: 'Legs',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 2,
                    partBody: 'Legs',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 3,
                    partBody: 'Legs',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 4,
                    partBody: 'Legs',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 5,
                    partBody: 'Legs',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 6,
                    partBody: 'Legs',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 7,
                    partBody: 'Legs',
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
