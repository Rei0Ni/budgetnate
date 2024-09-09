import 'package:budgetmate/Pages/Authentication/Login.dart';
import 'package:budgetmate/Services/DioHelper.dart';
import 'package:flutter/material.dart';

DioHelper dioHelper = DioHelper();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}
