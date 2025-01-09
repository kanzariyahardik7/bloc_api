import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                context.push("/product");
              },
              child: Container(
                color: Colors.red,
                height: 150,
                width: MediaQuery.sizeOf(context).width,
                child: const Center(
                  child: Text(
                    "Mater Products",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.push("/musiclist");
              },
              child: Container(
                color: Colors.red,
                height: 150,
                width: MediaQuery.sizeOf(context).width,
                child: const Center(
                  child: Text(
                    "Music List",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
