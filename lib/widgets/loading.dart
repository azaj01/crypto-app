import 'package:new_crypto_app/constants.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kWhite,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: kGreen,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please wait...",
                style: TextStyle(fontFamily: "MYRIADPRO", fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
