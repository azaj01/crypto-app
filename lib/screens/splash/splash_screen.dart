import 'dart:async';

import 'package:new_crypto_app/constants.dart';
import 'package:new_crypto_app/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({super.key});

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kBlack,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/splash.png"), fit: BoxFit.fitWidth),
        ),
        child: const SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("images/l.png"),
                height: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "new_crypto_app",
                style: TextStyle(
                    fontSize: 24, color: kGreen, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
