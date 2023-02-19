import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:venatus/screens/home_screen.dart';
import 'package:venatus/screens/signin_screen.dart';

import '../services/firebase_services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
           const Expanded(
              child: SizedBox(
                height: 10,
              ),
           ),
           Expanded(
            child: Image.asset(
              "assets/controller.png",
              height: 133,
              width: 134,
            ),
           ),
           const Expanded(
            child: Text(
              'Create Account',
              style: TextStyle(
                color: Color(0xFF4A4143),
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
              )
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 33, right: 33),
                child: TextField(
                  controller: _emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail_lock),
                    hintText: 'Enter Email Address',
                    fillColor: Color(0xFFD9D9D9),
                    focusColor: Color(0xFFD9D9D9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    filled: true,
                    prefixIconColor: Color(0xFF4A4143),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 33, right: 33),
                child: TextField(
                  obscureText: true,
                  controller: _passwordTextController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.local_drink_sharp),
                    hintText: 'Enter Password',
                    filled: true,
                    fillColor: Color(0xFFD9D9D9),
                    focusColor: Color(0xFFD9D9D9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIconColor: Color(0xFF4A4143),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 33, right: 33),
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailTextController.text, password: _passwordTextController.text
                    ).then((value){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A4143),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 25,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 33, right: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width* 1/4,
                      child: const Divider(
                        color: Color(0xFF4A4143),
                        thickness: 2,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 27, right: 27),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *1/4,
                      child: const Divider(
                        color: Color(0xFF4A4143),
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25,),
            Padding(
                padding: const EdgeInsets.only(left: 33, right: 33),
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseServices().signInWithGoogle();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD9D9D9),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(width: 34,),
                      FaIcon(
                        FontAwesomeIcons.google,
                        color: Color(0xFF4A4143),
                      ),
                      SizedBox(width: 51,),
                      Text(
                        'Google Sign in',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF4A4143)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?', style: TextStyle(fontSize: 14, color: Colors.black),),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const SigninScreen())));
                  }, child: const Text(
                    'Login', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              const Expanded(
                child: SizedBox(height: 10,),
              )
          ]
        ),
      ),
    );
  }
}