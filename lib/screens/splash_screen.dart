import 'package:flutter/material.dart';
import 'package:kasmaal/components/animated_logo.dart';
import 'package:kasmaal/router/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed(AppRoute.login);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: AnimatedLogo(),
          ),
        ),
      ),
    );
  }
}
