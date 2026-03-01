import 'package:flutter/cupertino.dart';
import 'dart:ui';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFF0A0A0A), 
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(flex: 2),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF1C1C1E),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: const Color.fromARGB(255, 102, 255, 242).withOpacity(0.2),
                          blurRadius: 40,
                          spreadRadius: 5,
                        )
                      ],
                    ),
                    child: const Icon(
                      CupertinoIcons.antenna_radiowaves_left_right,
                      size: 60,
                      color: Color.fromARGB(255, 65, 230, 242),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "OneRadar",
                    style: TextStyle(
                      fontFamily: "Absans",
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 4,
                      color: CupertinoColors.white,
                    ),
                  ),
                ],
              ),

              const Spacer(),
              Column(
                children: [
                  const Text(
                    "Tracking Reinvented",
                    style: TextStyle(
                      fontFamily: "Absans",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Real-time student trip monitoring with\nprecision and security you can trust.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Absans",
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      color: CupertinoColors.systemGrey.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 2),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromARGB(255, 65, 230, 242),
                      onPressed: () {},
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontFamily: "Absans",
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.4,
                          color: Color.fromARGB(255, 0, 87, 94),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CupertinoButton(
                    onPressed: () {},
                    child: const Text(
                      "Already have an account? Sign In",
                      style: TextStyle(
                        fontFamily: "Absans",
                        fontSize: 14,
                        color: CupertinoColors.systemGrey2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}