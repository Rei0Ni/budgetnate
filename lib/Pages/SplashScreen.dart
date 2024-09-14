import 'package:budgetmate/Pages/Authentication/Login.dart';
import 'package:budgetmate/Pages/Main/Dashboard.dart';
import 'package:budgetmate/Pages/OneTimeWelcome.dart';
import 'package:budgetmate/main.dart';
import 'package:flutter/material.dart';

class SplashScreenWithDelay extends StatefulWidget {
  const SplashScreenWithDelay({super.key});

  @override
  _SplashScreenWithDelayState createState() => _SplashScreenWithDelayState();
}

class _SplashScreenWithDelayState extends State<SplashScreenWithDelay> {
  Map<String, dynamic> dashboard = {};
  @override
  void initState() {
    super.initState();
    getDashboardData();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => prefs.isFirstLaunch()
                ? const OneTimeWelcome()
                : prefs.isUserLoggedIn()
                    ? DashboardPage(prefs.getUsername(), dashboard)
                    : const Login()),
      );
    });
  }

  void getDashboardData() async {
    var dashboardData = await dioHelper.getDashboardData();
    setState(() {
      dashboard = dashboardData!.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: const Color(0xFF209D86),
          child: const Center(
            child: Text(
              'BudgetMate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
