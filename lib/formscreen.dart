import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class formscreen extends StatefulWidget {
  const formscreen({super.key});

  @override
  State<formscreen> createState() => _formscreenState();
}

class _formscreenState extends State<formscreen> {
  final _formfeild = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final cpassController = TextEditingController();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  bool passToggle = true;
  bool cpassToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        title: const Text(
          'Form Validation',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: _formfeild,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/login.png",
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email)),
                  validator: (value) {
                    bool emailvalid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (value.isEmpty) {
                      return "enter a email";
                    }

                    if (!emailvalid) {
                      return 'Invalid Email';
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                      labelText: "phoneNumber",
                      hintText: 'ji',
                      suffixStyle: TextStyle(color: Colors.blue),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone)),
                  // validator: (value) {
                  // if (phoneController.text.length < 10) {
                  // return 'phno number must have 10 digits';
                  //}
                  // },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: passController,
                    obscureText: passToggle,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: "password",
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.password_rounded),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter a password";
                      } else if (passController.text.length < 8) {
                        return "minimum password upto 8 digits";
                      }
                    }),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: cpassController,
                  obscureText: cpassToggle,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      labelText: "confirmPassword",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            cpassToggle = !cpassToggle;
                          });
                        },
                        child: Icon(cpassToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter a  confirm password";
                    } else if (cpassController.text.length < 8) {
                      return "minimum password up to 8 digits";
                    }
                    if (passController.text != cpassController.text) {
                      return "Both passwords are mismatched";
                    }
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                InkWell(
                  onTap: () {
                    if (_formfeild.currentState!.validate()) {
                      print("success");
                    }
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already who have a ac means ? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
