
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management_live_project/data/service/network_caller.dart';
import 'package:task_management_live_project/utils/colors.dart';
import 'package:task_management_live_project/view/widget/snack_bar_message.dart';

import '../../../../utils/styles.dart';
import '../../../../utils/url.dart';
import '../signIn_screen/signIn_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/signup-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   bool _signUpProgress=false;

  @override
  Widget build(BuildContext context) {
    final textTheme= Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Join With Us",
             style: textTheme.titleLarge,
              ),
              Text(
                "Learn With Ostad Platform",
                style: head2TextStyle(context: context),
              ),
              const SizedBox(
                height: 10,
              ),
              _buildTextForm(),
              const SizedBox(
                height: 20,
              ),

              _buildSignInTextSection(),
            ],
          ),
        ),
      ),
    );
  }
//build text form
  Form _buildTextForm() {
    return Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (String? value) {
                      if(value?.trim().isEmpty??true){
                        return "email can't be empty";
                      }return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                    ),
                    validator: (String? value) {
                      if(value?.trim().isEmpty??true){
                        return "first name can't be empty";
                      }return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                    ),
                    validator: (String? value) {
                      if(value?.trim().isEmpty??true){
                        return "last name can't be empty";
                      }return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _mobileNumberController,
                    decoration: const InputDecoration(
                      hintText: 'Mobile Number',
                    ),
                    validator: (String? value) {
                      if(value?.trim().isEmpty??true){
                        return "number can't be empty";
                      }return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    validator: (String? value) {
                      if(value?.trim().isEmpty??true){
                        return "Password can't be empty";
                      }if(value!.length<6){
                        return "password must be at least 6 characters";
                      }return null;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // click button
                  Visibility(
                    visible: _signUpProgress==false,
                    replacement: Center(child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),),
                    child: ElevatedButton(
                      onPressed:_onTapSignup,
                      child: const Text(
                        "Sign Up",
                      ),
                    ),
                  ),
                ],
              ),
            );
  }


  //signup on tap
   void _onTapSignup() {
    if(_formKey.currentState!.validate()){
      _registerUser();
      debugPrint("success");
      Navigator.pushNamed(context, SignInScreen.routeName);
    }else{
      debugPrint("error");
    }
   }

//signup api function
  Future <void> _registerUser()async{
    _signUpProgress = true;
    setState(() {

    });

    //add body
    Map<String,dynamic> requestBody = {
      "email":_emailController.text.trim(),
      "firstName":_firstNameController.text.trim(),
      "lastName":_lastNameController.text.trim(),
      "mobile":_mobileNumberController.text.trim(),
      "password":_passwordController.text.trim()
    };

    // api intention
    final NetworkResponse response = await NetworkCaller.postRequest(
     url: Urls.signUp,
      body:requestBody);
    _signUpProgress = false;
    setState(() {});
    if (response.isSuccess) {
      _clearTextField();
    showSnackBar("Sign Up Successfully", context);
    }else{
      return showSnackBar(response.errorMessage, context,);
    }
  }

  //clear text field
  void _clearTextField(){
    _emailController.clear();
    _passwordController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _mobileNumberController.clear();
  }


  // build sign in section
  RichText _buildSignInTextSection() {
    return RichText(text: TextSpan(
        text: "Already have an account?",
        style:Theme.of(context).textTheme.bodySmall,
        children: [
          TextSpan(
            text: "Sign In",
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = (){
              Navigator.pop(context);
            },
          ),
        ]
    ),
    );
  }

  // dispose
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }
}
