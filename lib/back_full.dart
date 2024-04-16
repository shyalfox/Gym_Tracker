import 'package:flutter/material.dart';
import 'package:gym_counter/excercise_list_back.dart';

class BackFull extends StatefulWidget {
  const BackFull({super.key});

  @override
  State<BackFull> createState() => _BackFullState();
}

class _BackFullState extends State<BackFull> {
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
                'Back',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  ExerciseCard(
                    exerId: 1,
                    partBody: 'Back',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 2,
                    partBody: 'Back',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 3,
                    partBody: 'Back',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 4,
                    partBody: 'Back',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 5,
                    partBody: 'Back',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 6,
                    partBody: 'Back',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 7,
                    partBody: 'Back',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 8,
                    partBody: 'Back',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 9,
                    partBody: 'Back',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExerciseCard(
                    exerId: 10,
                    partBody: 'Back',
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
