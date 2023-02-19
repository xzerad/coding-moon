import 'package:disiability/components/custom_button.dart';
import 'package:disiability/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignInBody(),
      ),
    );
  }
}

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Create Account", style: Theme.of(context).textTheme.displayMedium,),
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Please enter email to continue.", style: Theme.of(context).textTheme.displaySmall,),
              ),
              const CustomTextField(hint: "Name"),
              const CustomTextField(hint: "Email"),
              const CustomTextField(hint: "Phone number"),
              const CustomTextField(hint: "Password"),
              const CustomTextField(hint: "New Password"),
              Row(
                children: const [
                  Expanded(child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomButton(text: "Register", backgroundColor: Colors.white, foregroundColor: Colors.black),
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I'm already a user. Sign-in", style: Theme.of(context).textTheme.displayMedium,),
                ],
              )

            ],
          ),
        ),
      );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hint}) : super(key: key);
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 2.0)

          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 1.0)


          ),

          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.black
      ),),
    )
    ;
  }
}

