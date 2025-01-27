
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management_live_project/data/service/network_caller.dart';
import 'package:task_management_live_project/utils/colors.dart';
import 'package:task_management_live_project/view/screens/task_screens/nav_screen/nav_screen.dart';
import '../../../../controllers/auth_controller.dart';
import '../../../../data/models/user_model.dart';
import '../../../../utils/app_text.dart';
import '../../../../utils/styles.dart';
import '../../../../utils/url.dart';
import '../../../widget/sign_in_up_section.dart';
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
               AppTexts.signInHeadline,
                style:titleStyle,
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
                child: Text(AppTexts.forgotPass,style: bodySmallStyle
                ),
              ),
              //sign up text section
              SignInUpSection(context: context,text: AppTexts.signUp,
              onTap:(){
                Navigator.pushNamedAndRemoveUntil(context, SignUpScreen.routeName, (_) => false);
              },
              )
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
    showSnackBar(AppTexts.success, context);


    }else{
      showSnackBar(AppTexts.failed, context);
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
              hintText: AppTexts.emailHint,
            ),
            validator: (String? value) {
              if(value?.trim().isEmpty??true){
                return AppTexts.emailError;
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
              hintText: AppTexts.passwordHint,
            ),
            validator: (String? value) {
              if(value?.trim().isEmpty??true){
                return AppTexts.passwordError;
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
              child:  const Text( AppTexts.signIn,
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
        "password":_passwordController.text
    };
    // api intention
 final NetworkResponse response = await NetworkCaller.postRequest(
     body: requestBody, url: Urls.signIn);
 if (response.isSuccess) {
        String token= response.responseData!['token'];
 UserModel userModel= UserModel.fromJson(response.responseData!['data']);
await AuthController.saveUserData(token, userModel);

        Navigator.pushNamedAndRemoveUntil(context,  NavScreen.routeName,  (_) => false);

_clearTextField();
    }else{
      _signInProgress = false;
      setState(() {

      });
      if(response.statusCode==401){
        return showSnackBar(AppTexts.invalidMailPassword, context);
      }
      return showSnackBar(response.errorMessage, context);
    }
  }

  //clear text field
  void _clearTextField(){
    _emailController.clear();
    _passwordController.clear();
  }



  //dispose
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
