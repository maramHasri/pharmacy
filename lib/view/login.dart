import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled32/bloc/login_bloc.dart';
import 'package:untitled32/model/userModel.dart';
import 'package:untitled32/view/classifications.dart';
import 'package:untitled32/view/sign.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController Number = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    bool pass = true;
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xff17A274),
            title: const Text(
              "login",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Form(
            key: formState,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: CircleAvatar(
                        radius: 103,
                        backgroundColor: Colors.green,
                        child: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage("images/pharmacy.png")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                        width: 400,
                        child: TextFormField(
                          controller: Number,
                          validator: (String? value) {
                            if (value == '' || value!.isEmpty) {
                              return 'please enter your phone nember';
                            } else if (value.length < 10) {
                              return "password must be 10 ";
                            } else {
                              return null;
                            }
                          },
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                        width: 400,
                        child: TextFormField(
                          controller: password,
                          validator: (String? value) {
                            if (value == "") {
                              return "please enter your password";
                            } else {
                              return null;
                            }
                          },
                          obscureText: pass,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.key),
                              prefixIconColor: Colors.green,
                              label: Text(
                                "Enter your password",
                                style: TextStyle(color: Colors.green),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: SizedBox(
                        width: 400,
                        height: 100,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const Text(" want to  create an account",
                                  style: TextStyle(fontSize: 15)),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => sign()),
                                    );
                                  },
                                  child: const Text(" SIGN UP ",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 17))),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formState.currentState!.validate()) {
                          context.read<LoginBloc>().add(SendLoginModel(
                              user: UserModel(
                                  number: Number.text,
                                  password: password.text)));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Classifications()),
                          );
                        }

                        // Do something when the button is pressed
                        //enter the home page
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff17A274),
                      ),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Color.fromARGB(255, 233, 231, 231)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
