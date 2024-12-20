
import 'package:flutter/material.dart';

import '../../../../utils/styles.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const routeName = '/registration-screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Join With Us",style: headTextStyle(),),
              Text("Learn With Ostad Platform",style: head2TextStyle(context:context),),
              const SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Mobile',
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: MediaQuery.sizeOf(context).height*.07,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){},
                    style: appButtonStyle(),
                    child: Text("Register",style: buttonTextStyle(
                        context:context
                    ),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
