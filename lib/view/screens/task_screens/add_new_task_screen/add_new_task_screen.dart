
import 'package:flutter/material.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});
  static const routeName = '/add-new-task-screen';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
 final TextEditingController  _titleController = TextEditingController();
 final TextEditingController  _descriptionController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text("Add New Task"),
        const Text("data"),
        Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: "Title"
              ),
            ),
            TextFormField(
              controller: _descriptionController,
              maxLines: 8,
              decoration: const InputDecoration(
                hintText: "Description",
                
              ),
            ),
            ElevatedButton(onPressed: (){},
                child: const Text("Add Task")),
          ],),
        ),

      ],)
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }


}
