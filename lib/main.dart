import 'package:flutter/material.dart';
import 'package:gym_counter/selection_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark, // Set the theme mode to dark
      darkTheme: ThemeData.dark().copyWith(
          // Customize the dark theme
          colorScheme: const ColorScheme.dark(
            primary: Colors.grey, // Change the primary color
            secondary: Colors.deepOrange, // Change the secondary color
          ),
          textTheme: Typography.whiteCupertino),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome! Sanish, No Excuses'),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: CardWithThreeSections(),
          ),
        ),
      ),
    );
  }
}

class CardWithThreeSections extends StatelessWidget {
  const CardWithThreeSections({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            ExcerciseMenu(
              excerciseName: 'Chest',
              excerciseCour: 'Get Big ChestS',
              listcounter: 1,
            ),
            SizedBox(height: 10.0),
            ExcerciseMenu(
              excerciseName: 'Tricep',
              excerciseCour: 'Get Macho',
              listcounter: 2,
            ),
            SizedBox(height: 10.0),
            ExcerciseMenu(
              excerciseName: 'Back',
              excerciseCour: 'Get Wings',
              listcounter: 3,
            ),
            SizedBox(height: 10.0),
            ExcerciseMenu(
              excerciseName: 'Biceps',
              excerciseCour: 'Soley Doley',
              listcounter: 4,
            ),
            SizedBox(height: 10.0),
            ExcerciseMenu(
              excerciseName: 'Shoulder',
              excerciseCour: '3d?',
              listcounter: 5,
            ),
            SizedBox(height: 10.0),
            ExcerciseMenu(
              excerciseName: 'Legs',
              excerciseCour: 'T_T',
              listcounter: 6,
            ),
            SizedBox(height: 10.0),
            ExcerciseMenu(
              excerciseName: 'Cardio/Forearms/Abs',
              excerciseCour: '<3',
              listcounter: 7,
            ),
          ],
        ),
      ),
    );
  }
}
