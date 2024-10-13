import 'package:budgetmate/Pages/Main/TransactionDetails.dart';
import 'package:budgetmate/Pages/SplashScreen.dart';
import 'package:budgetmate/Services/DioHelper.dart';
import 'package:budgetmate/Services/SharedPreferencesHelper.dart';
import 'package:flutter/material.dart';

DioHelper dioHelper = DioHelper();
SharedPreferencesHelper prefs = SharedPreferencesHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.init();
  await dioHelper.init();
  
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
      home: const TransactionDetailsPage(),
    );
  }
}
