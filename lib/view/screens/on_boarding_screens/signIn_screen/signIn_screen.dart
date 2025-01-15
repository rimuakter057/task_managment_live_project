
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management_live_project/data/service/network_caller.dart';
import 'package:task_management_live_project/utils/colors.dart';
import 'package:task_management_live_project/view/screens/task_screens/nav_screen/nav_screen.dart';
import '../../../../controllers/auth_controller.dart';
import '../../../../data/models/user_model.dart';
import '../../../../utils/styles.dart';
import '../../../../utils/url.dart';
import '../../../widget/snack_bar_message.dart';
import '../Signup_screen/signup_screen.dart';
import '../forget_email_verify_screen/forget_email_verify_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String routeName = '/signIn-screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _signInProgress = false;
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final bodySmallStyle=Theme.of(context).textTheme.bodySmall;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Get Started With",
                style:titleStyle,
              ),
              Text(
                "Learn With Ostad Platform",
                style: head2TextStyle(context: context),
              ),
              const SizedBox(
                height: 10,
              ),
              _buildTextForm(context),
              const SizedBox(
                height: 10,
              ),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, ForgetEmailVerifyScreen.routeName);
              },
                child: Text("Forgot Password?",style: bodySmallStyle
                ),
              ),
              _buildSignUpTextSection(),
            ],
          ),
        ),
      ),
    );
  }

// sign in on tap
  void _signInOnTap(){
    if(_formKey.currentState!.validate()){
      _signInUser();
      debugPrint("success");
    }else{
      print("error message");
    }
  }
  //sign in form
  Form _buildTextForm(BuildContext context) {
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
            obscureText: true,
            controller: _passwordController,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (String? value) {
              if(value?.trim().isEmpty??true){
                return "password can't be empty";
              }if(value!.length<6){
                return "password must be at least 6 characters";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Visibility(
            visible: _signInProgress==false,
            replacement: Center(child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),),
            child: ElevatedButton(
              onPressed: _signInOnTap,
              child: const Text(
                "Sign In",
              ),
            ),
          ),
        ],
      ),
    );
  }
  // sign api function
  Future <void> _signInUser()async{
    _signInProgress==true;
    setState(() {

    });
    //add body
    Map<String,dynamic> requestBody = {
        "email":_emailController.text.trim(),
        "password":_passwordController.text.trim()
    };
    // api intention
 final NetworkResponse response = await NetworkCaller.postRequest(
     body: requestBody, url: Urls.signIn);
 if (response.isSuccess) {
        String token= response.responseData!['token'];
 UserModel userModel= UserModel.fromJson(response.responseData!['data']);
await AuthController.saveUserData(token, userModel);
      Navigator.pushReplacementNamed(context, NavScreen.routeName);
    }else{
      _signInProgress = false;
      setState(() {

      });
      if(response.statusCode==401){
        return showSnackBar("Invalid email or password", context);
      }
      return showSnackBar(response.errorMessage, context);
    }
  }

  //clear text field
  void _clearTextField(){
    _emailController.clear();
    _passwordController.clear();
  }

  //sign up text section
  RichText _buildSignUpTextSection() {
    return RichText(text: TextSpan(
              text: "you don't have an account?",
                style:Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(
                  text: "Sign up",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = (){
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                ),
              ]
    ),
    );
  }
  //dispose
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
