import 'package:bloc_api/widget/myimage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkVideoPlayed();
    super.initState();
  }

  Future<void> checkVideoPlayed() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        context.pushReplacement("/login");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Center(
        child: MyImage(
            height: MediaQuery.sizeOf(context).height * 0.45,
            width: MediaQuery.sizeOf(context).width,
            imagePath: "logo.png",
            fit: BoxFit.contain),
      ),
    ));
  }
}
