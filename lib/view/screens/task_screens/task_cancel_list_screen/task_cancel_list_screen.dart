
import 'package:flutter/material.dart';

class TaskCancelListScreen extends StatefulWidget {
  const TaskCancelListScreen({super.key});
  static const routeName = '/task-cancel-list-screen';

  @override
  State<TaskCancelListScreen> createState() => _TaskCancelListScreenState();
}

class _TaskCancelListScreenState extends State<TaskCancelListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Task Cancel List Screen")),
    );
  }
}
