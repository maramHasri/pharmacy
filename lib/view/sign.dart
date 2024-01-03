import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart';
import 'package:untitled32/model/userModel.dart';
import 'package:untitled32/view/classifications.dart';

import '../service/userService.dart';

class sign extends StatefulWidget {
  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  bool usa = false;
  bool isLoading = false;
  TextEditingController number = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController name = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff17A274),
        title: const Text(
          "SIGN UP",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: CircleAvatar(
                    radius: 103,
                    backgroundColor: const Color(0xff17A274),
                    child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("images/pharmacy.png")),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value == "") {
                      return "please enter your name";
                    } else {
                      return null;
                    }
                  },
                  controller: name,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.green,
                      label: Text(
                        "Enter your name",
                        style: TextStyle(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 13,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty || value == null) {
                      return "please enter your Email";
                    } else {
                      return null;
                    }
                  },
                  controller: email,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.green,
                      label: Text(
                        "Enter your email",
                        style: TextStyle(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      )),
                ),
                const SizedBox(
                  height: 13,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (String? value) {
                    if (value == "") {
                      return "please enter your password";
                    } else {
                      return null;
                    }
                  },
                  controller: password,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      prefixIconColor: Colors.green,
                      label: Text(
                        "Enter your passwrd",
                        style: TextStyle(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      )),
                ),
                const SizedBox(
                  height: 13,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value == "") {
                      return "please enter your number";
                    } else {
                      return null;
                    }
                  },
                  controller: number,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      prefixIconColor: Colors.green,
                      label: Text(
                        "Enter your number",
                        style: TextStyle(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ImpUserService service = ImpUserService();
                            service.register(
                              UserModel(
                                number: number.text,
                                password: password.text,
                                email: email.text,
                                username: name.text,
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Classifications()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 158, 207, 160),
                        ),
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                              color: Color.fromARGB(255, 249, 249, 249)),
                        ),
                      ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
