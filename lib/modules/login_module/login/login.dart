import 'package:bmi/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:bmi/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailContorller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   var formKey = GlobalKey<FormState>();

  onSubmit(value) {
    print(value);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key:formKey ,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: font3,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  mailField(
                      controller: mailContorller,
                      onSubmit: (value) {
                        onSubmit(value);
                      }),
                  SizedBox(
                    height: 18,
                  ),
                  PasswordField(controller: passwordController),
                  SizedBox(
                    height: 24,
                  ),
                  defaultButton(
                    text: "LOGIN",
                    function: (){
                    if(formKey.currentState !=null && formKey.currentState!.validate())
                    {
                        print("validated");
                    }
                    return null;
                  }),
                  SizedBox(
                    height: 24,
                  ),
                  defaultButton(function: (){},
                  text: "REGISTER")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
