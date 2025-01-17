
import 'package:flutter/material.dart';
import '../add_new_task_screen/add_new_task_screen.dart';
import '../new_task_list_screen/new_task_list_screen.dart';
import '../task_cancel_list_screen/task_cancel_list_screen.dart';
import '../task_completed_list_screen/task_completed_list_screen.dart';
import '../task_progress_list_screen/task_progress_list_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});
  static const routeName = '/nav-screen';

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  List <Widget>_screens=[
    NewTaskListScreen(),
    TaskCompletedListScreen(),
    AddNewTaskScreen(),
    TaskProgressListScreen(),
    TaskCancelListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body:_screens[_selectedIndex],
       bottomNavigationBar: NavigationBar(
           selectedIndex: _selectedIndex,
           onDestinationSelected: (index){
             _selectedIndex=index;
             setState(() {
             });
           },
           destinations: [
         NavigationDestination(icon: Icon(Icons.home),label: 'New'),
         NavigationDestination(icon: Icon(Icons.person),label: 'Complete'),
         NavigationDestination(icon: Icon(Icons.search), label: 'Create'),
         NavigationDestination(icon: Icon(Icons.home),label: 'Progress'),
         NavigationDestination(icon: Icon(Icons.person),label: 'Cancle'),
       ]),
    );
  }
}
