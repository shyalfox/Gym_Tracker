// ignore_for_file: use_build_context_synchronously, file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym_counter/database/databse_helper_legs.dart';

class ExerciseCard extends StatefulWidget {
  const ExerciseCard({
    super.key,
    required this.exerId,
    required this.partBody,
  });
  final int exerId;
  final String partBody;
  @override
  ExerciseCardState createState() => ExerciseCardState();
}

class ExerciseCardState extends State<ExerciseCard> {
  late int excerId;
  DatabaseHelper dbHelper = DatabaseHelper();
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerWeight = TextEditingController();
  TextEditingController controllerReps = TextEditingController();
  List<Map<String, dynamic>> databaseContents = [];
  Map<String, dynamic>? _chestData;

  bool isEditing = false;
  String excerName = 'Excercise Name';
  String termWeights = '0 0 0 0';
  String attemptedreps = '0 0 0 0';
  late String partBody;

  Future<void> loadDatabaseContents() async {
    try {
      final databaseHelper = DatabaseHelper();
      final contents = await databaseHelper.getDatabaseContents(partBody);
      setState(() {
        databaseContents = contents;
      });
    } catch (ex) {
      // Handle exception
      if (kDebugMode) {
        print("Failed to load database contents: $ex");
      }
    }
  }

  Future<void> checkDatabaseEntry() async {
    final databasehelper = DatabaseHelper();

    // Check if the database contains an entry for this instance ID
    bool entryExists =
        await databasehelper.databaseContainsEntry(excerId, partBody);

    if (!entryExists) {
      // If the entry doesn't exist, insert the default values into the database
      await databasehelper.insertDefaultValues(
          excerId, excerName, termWeights, attemptedreps, partBody);
    }
  }

  Future<void> _fetchChestData(int excerId, String partBody) async {
    Map<String, dynamic>? data =
        await DatabaseHelper().getTricepData(excerId, partBody);
    setState(() {
      _chestData = data;
    });
  }

  Future<void> _updateData() async {
    int id = excerId; // Your ID
    String excerName = controllerTitle.text;
    String termWeights = controllerWeight.text;
    String attemptedReps = controllerReps.text;

    int rowsAffected = await DatabaseHelper().updateValue(
      id,
      excerName,
      termWeights,
      attemptedReps,
    );

    if (rowsAffected > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data updated successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update data')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    excerId = widget.exerId;
    partBody = widget.partBody;
    _fetchChestData(excerId, partBody);
    checkDatabaseEntry();
    loadDatabaseContents();
    if (kDebugMode) {
      print('hello $excerId');
    }

    // Assign the value from the constructor to the internal variable
  }

  @override
  Widget build(BuildContext context) {
    return _chestData != null
        ? Card(
            elevation: 15,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    ' ${_chestData!['excerName']}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: isEditing
                            ? TextFormField(
                                controller: controllerTitle,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                    hintText: 'Enter Excercise Name',
                                    hintStyle: TextStyle(fontSize: 14)),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Terminologies',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Value',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Weights(KG)',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${_chestData!['termWeights']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: isEditing
                            ? TextFormField(
                                controller: controllerWeight,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    hintText: 'Enter New Weights',
                                    hintStyle: TextStyle(fontSize: 14)),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Attempted Reps',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${_chestData!['attemptedreps']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: isEditing
                            ? TextFormField(
                                controller: controllerReps,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    hintText: 'Enter Attempted Reps',
                                    hintStyle: TextStyle(fontSize: 14)),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isEditing = !isEditing;
                            if (isEditing) {
                              controllerTitle.text = _chestData!['excerName'];
                              controllerWeight.text =
                                  _chestData!['termWeights'];
                              controllerReps.text =
                                  _chestData!['attemptedreps'];
                            }
                          });
                        },
                        child: Text(isEditing ? 'Cancel' : 'Edit',
                            style: const TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(width: 8),
                      if (isEditing)
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isEditing = false;
                              _updateData();
                              _fetchChestData(excerId, partBody);
                            });
                          },
                          child: const Text('Save',
                              style: TextStyle(color: Colors.white)),
                        ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  @override
  void dispose() {
    controllerTitle.dispose();
    controllerWeight.dispose();
    controllerReps.dispose();
    super.dispose();
  }
}
