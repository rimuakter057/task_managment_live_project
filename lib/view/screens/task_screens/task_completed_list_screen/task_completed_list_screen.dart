
import 'package:flutter/material.dart';

class TaskCompletedListScreen extends StatefulWidget {
  const TaskCompletedListScreen({super.key});

  @override
  State<TaskCompletedListScreen> createState() => _TaskCompletedListScreenState();
}

class _TaskCompletedListScreenState extends State<TaskCompletedListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Task Completed List Screen")),
    );
  }
}
