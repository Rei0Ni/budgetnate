import 'package:budgetmate/Pages/Authentication/Login.dart';
import 'package:budgetmate/Pages/Main/Home.dart';
import 'package:budgetmate/main.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  bool passwordVisible = false;
  String? usernameError;
  String? emailError;
  String? passwordError;
  String? passwordConfirmationError;

  validateUsername(String username) {
    if (username.isEmpty) {
      setState(() {
        usernameError = 'Can\'t be empty';
      });
    } else {
      setState(() {
        usernameError = null;
      });
    }
    return usernameError;
  }

  validateEmail(String email) {
    var emailValid = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email);
    if (!emailValid || email.isEmpty) {
      setState(() {
        emailError = "Not a valid Email";
      });
    } else {
      setState(() {
        emailError = null;
      });
    }
    return emailError;
  }

  validatePassword(String password) {
    if (password.isEmpty) {
      setState(() {
        passwordError = 'Can\'t be empty';
      });
    } else {
      setState(() {
        passwordError = null;
      });
    }
    return passwordError;
  }

  validatePasswordConfirmation(String passwordConfirmation) {
    if (passwordConfirmation.isEmpty) {
      setState(() {
        passwordError = 'Can\'t be empty';
      });
    } else if (passwordConfirmation != passwordController.text) {
      setState(() {
        passwordError = 'Password and Confirmation Missmatch';
      });
    } else {
      setState(() {
        passwordError = null;
      });
    }
    return passwordError;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox.fromSize(
                      size: const Size(double.infinity, 105),
                    ),
                    const Center(
                      child: Text(
                        "BudgetMate",
                        style: TextStyle(
                            color: Color(0xFF3E7C78),
                            fontWeight: FontWeight.bold,
                            fontSize: 50),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(36, 60, 10, 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create an Account",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Manage Your FInancial Expenses today",
                            style: TextStyle(
                                color: Color(0xFF999EA1), fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  "Username",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              TextFormField(
                                controller: usernameController,
                                validator: (value) => validateUsername(value!),
                                style: const TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                    hintText: "Please Enter Your Username",
                                    hintStyle: const TextStyle(
                                        color: Color(0xFF1F1F1F)),
                                    errorText: usernameError,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 6, 30, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              TextFormField(
                                controller: emailController,
                                validator: (value) => validateEmail(value!),
                                style: const TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                    hintText: "Please Enter Your Email",
                                    hintStyle: const TextStyle(
                                        color: Color(0xFF1F1F1F)),
                                    errorText: emailError,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 6, 30, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              TextFormField(
                                controller: passwordController,
                                validator: (value) => validatePassword(value!),
                                style: const TextStyle(fontSize: 14),
                                obscureText: !passwordVisible,
                                decoration: InputDecoration(
                                    hintText: "Please Enter Your Password",
                                    hintStyle: const TextStyle(
                                        color: Color(0xFF1F1F1F)),
                                    errorText: passwordError,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            passwordVisible = !passwordVisible;
                                          });
                                        },
                                        icon: Icon(passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 6, 30, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  "Password Confirmation",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              TextFormField(
                                controller: passwordConfirmationController,
                                validator: (value) =>
                                    validatePasswordConfirmation(value!),
                                style: const TextStyle(fontSize: 14),
                                obscureText: !passwordVisible,
                                decoration: InputDecoration(
                                    hintText: "Please Confirm Your Password",
                                    hintStyle: const TextStyle(
                                        color: Color(0xFF1F1F1F)),
                                    errorText: passwordConfirmationError,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            passwordVisible = !passwordVisible;
                                          });
                                        },
                                        icon: Icon(passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Container(
                              width: 360,
                              height: 67,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: const Offset(
                                        0, 9), // changes position of shadow
                                  ),
                                ],
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff5e9d98),
                                      Color(0xff5b9b96),
                                      Color(0xff549691),
                                      Color(0xff498e89),
                                      Color(0xff428984),
                                      Color(0xff3f8782),
                                    ]),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  // print("Button Pressed");
                                  if (_key.currentState!.validate()) {
                                    var result = await dioHelper.register(
                                        usernameController.text,
                                        emailController.text,
                                        passwordController.text);
                                    if (result!.statusCode == 200 &&
                                        result.data["Result"] ==
                                            "User created successfully") {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const Login(),
                                        ),
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Ink(
                                    child: const Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Text("Already Have an Account?"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("Sign Up Pressed!!!");
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const Login(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Color(0xFF160062),
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
