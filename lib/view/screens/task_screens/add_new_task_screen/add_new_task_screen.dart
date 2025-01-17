
import 'package:flutter/material.dart';
import 'package:task_management_live_project/data/service/network_caller.dart';
import 'package:task_management_live_project/view/widget/snack_bar_message.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/url.dart';

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
 bool _addNewTaskInProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Add New Task",style: Theme.of(context).textTheme.titleLarge,),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                child: Column(children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      hintText: "Title"
                    ),
                    validator: (String? value) {
                      if(value?.trim().isEmpty??true){
                        return "title can't be empty";
                      }
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 8,
                    decoration: const InputDecoration(
                      hintText: "Description",
                    ),
                    validator: (String? value) {
                      if(value?.trim().isEmpty??true){
                        return "description can't be empty";
                      }
                    },
                  ),
                  const SizedBox(height: 25,),
                  Visibility(
                    visible: _addNewTaskInProgress==false,
                    replacement: Center(child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),),
                    child: ElevatedButton(onPressed: ()async{
                      if(_formKey.currentState?.validate()??false){
                      await  _creatNewTask();
                        Navigator.pop(context);
                      }
                    },
                        child: const Text("Add Task")),
                  ),
                ],),
              ),
            ),
          ),

        ],),
      )
    );
  }

  Future <void> _creatNewTask()async{
    _addNewTaskInProgress = true;
    setState(() {
    });
    Map<String,dynamic> requestBody = {
      "title":_titleController.text.trim(),
      "description": _descriptionController.text.trim(),
      "status":"New"
    };
    final NetworkResponse response = await NetworkCaller.postRequest(body: requestBody,
        url: Urls.createTask);
    if(response.isSuccess){
     /* _addNewTaskInProgress = false;
      setState(() {
      });*/
      _clearTextField;
    }else{
      showSnackBar( response.errorMessage, context);
    }
  }

 //clear text field
 void _clearTextField(){
   _titleController.clear();
   _descriptionController.clear();
 }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }


}
