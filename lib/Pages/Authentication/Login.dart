import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _key = GlobalKey();

  bool passwordVisible = false;
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
                      size: Size(double.infinity, 105),
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
                            "Hi, Welcome Back! 👋",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Hello again, we missed you!",
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
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Text(
                                  "Username",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              TextFormField(
                                style: const TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                    hintText: "Please Enter Your Username",
                                    hintStyle: const TextStyle(
                                        color: Color(0xFF1F1F1F)),
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
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              TextFormField(
                                style: const TextStyle(fontSize: 14),
                                obscureText: !passwordVisible,
                                decoration: InputDecoration(
                                    hintText: "Please Enter Your Password",
                                    hintStyle: const TextStyle(
                                        color: Color(0xFF1F1F1F)),
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
                      padding: const EdgeInsets.only(top: 200),
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
                                gradient: LinearGradient(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // print("Button Pressed");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: Ink(
                                      child: const Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
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
                                  child: Text("Don't have an account?"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("Sign Up Pressed!!!");
                                  },
                                  child: const Text(
                                    "Sign Up",
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
