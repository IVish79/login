import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class registerpage extends StatefulWidget {
  const registerpage({Key? key}) : super(key: key);

  @override
  State<registerpage> createState() => _registerPageState();
}

class _registerPageState extends State<registerpage> {

  ImagePicker _picker = ImagePicker();

  TextEditingController tname = TextEditingController();
  TextEditingController temail = TextEditingController();
  TextEditingController tcontact = TextEditingController();
  TextEditingController tpassword = TextEditingController();

  bool viewpass = true;

  String imagepath = '';
  String nametext = '';
  String emailtext = '';
  String contacttext = '';
  String passtext = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        showDialog(
                            builder: (context) {
                              return SimpleDialog(
                                title: Text("Select Picture"),
                                children: [
                                  ListTile(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      XFile? photo = await _picker.pickImage(
                                          source: ImageSource.camera);
                                      if (photo != null) {
                                        setState(() {
                                          imagepath = photo.path;
                                        });
                                      }
                                    },
                                    title: Text("Camera"),
                                  ),
                                  ListTile(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      XFile? photo = await _picker.pickImage(
                                          source: ImageSource.gallery);
                                      if (photo != null) {
                                        setState(() {
                                          imagepath = photo.path;
                                        });
                                      }
                                    },
                                    title: Text("Gallery"),
                                  ),
                                ],
                              );
                            },
                            context: context);
                      },
                      child: imagepath.isEmpty
                          ? Container(
                        height: 100,
                        width: 100,
                        child: Image.asset("images/user.png"),
                      )
                          : Image.file(
                        File(imagepath),
                        height: 100,
                        width: 100,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: tname,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Name",
                      errorText: nametext.isEmpty ? null : nametext,
                      filled: true,
                      border: OutlineInputBorder(),
                      fillColor: Colors.grey.shade200,
                      suffixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    onSubmitted: (value) {},
                    controller: temail,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(),
                      fillColor: Colors.grey.shade200,
                      hintText: "Email",
                      errorText: emailtext.isEmpty ? null : emailtext,
                      suffixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: tcontact,
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 14, left: 20),
                      hintText: "Phone Number",
                      suffixIcon: Icon(Icons.call),
                      filled: true,
                      errorText: contacttext.isEmpty ? null : contacttext,
                      border: OutlineInputBorder(),
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: tpassword,
                    obscureText: viewpass,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 14, left: 20),
                      hintText: "Password",
                      filled: true,
                      errorText: passtext.isEmpty ? null : passtext,
                      border: OutlineInputBorder(),
                      fillColor: Colors.grey.shade200,
                      suffixIcon: IconButton(
                          onPressed: () {
                            viewpass = !viewpass;
                            setState(() {});
                          },
                          icon: viewpass
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blueGrey.shade300,
                    child: TextButton(
                        onPressed: () {
                          String name = tname.text;
                          String email = temail.text;
                          String contact = tcontact.text;
                          String pass = tpassword.text;
                          if (tname.text.isEmpty) {
                            nametext = "Name is Required";
                          } else {
                            nametext = '';
                          }
                          if (temail.text.isEmpty) {
                            emailtext = "Email is Required";
                          } else {
                            emailtext = '';
                          }
                          if (tcontact.text.isEmpty) {
                            contacttext = "Contact is Required";
                          } else {
                            contacttext = "";
                          }
                          if (tpassword.text.isEmpty) {
                            passtext = "Password is Required";
                          } else {
                            passtext = "";
                          }
                          if (imagepath.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Image is Required",
                                  style: TextStyle(color: Colors.white)),
                            ));
                          }

                          setState(() {});
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
