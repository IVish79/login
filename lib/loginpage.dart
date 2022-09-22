/*
import 'package:flutter/material.dart';
import 'package:login/registerpage.dart';


class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  TextEditingController temail = TextEditingController();
  TextEditingController tpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Card(
        shadowColor: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14)))),
                textAlign: TextAlign.center,
                controller: temail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: "Password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14)))),
                textAlign: TextAlign.center,
                controller: tpassword,
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Login")),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return registerpage();
                  },
                ));
              },
              child: Container(
                height: 45,
                alignment: Alignment.center,
                child: Text("Not Register ? Register here"),
              ),
            )
          ],
        ),
      ),
    ),);
  }
}
*/ //old try

import 'package:flutter/material.dart';
import 'package:login/registerpage.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _LoginPageState();
}

class _LoginPageState extends State<loginpage> {
  TextEditingController temail = TextEditingController();
  TextEditingController tpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 15.0, right: 15),
              child: TextField(
                controller: temail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(13),
                            bottomRight: Radius.circular(13))),
                    filled: true,
                    //errorText: "sdf",
                    labelText: "Email or Mobile No.",
                    fillColor: Colors.grey.shade200),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 220),
              child: TextField(
                controller: temail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13),
                        bottomRight: Radius.circular(13))),
                    filled: true,
                    //errorText: "sdf",
                    labelText: "Password",
                    fillColor: Colors.grey.shade200),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 245.0, top: 272),
              child:
                  TextButton(onPressed: () {}, child: Text("Forgot Password?")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 350, right: 15),
              child: Container(
                  width: double.infinity,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("Login"))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 406),
              child: Text("Don't have account?"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200, top: 390),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return registerpage();
                      },
                    ));
                  },
                  child: Text("Register")),
            ),
          ],
        ),
      )),
    );
  }
}
