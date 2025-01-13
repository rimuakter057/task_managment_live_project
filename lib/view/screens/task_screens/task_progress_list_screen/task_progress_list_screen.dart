
import 'package:flutter/material.dart';

class TaskProgressListScreen extends StatefulWidget {
  const TaskProgressListScreen({super.key});
  static const routeName = '/task-progress-list-screen';

  @override
  State<TaskProgressListScreen> createState() => _TaskProgressListScreenState();
}

class _TaskProgressListScreenState extends State<TaskProgressListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Task Progress List Screen")),
    );
  }
}
