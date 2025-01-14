import 'package:flutter/material.dart';
import 'package:gd1_d_1686/showProfile.dart';
import 'package:gd1_d_1686/isiLinkTree.dart';
import 'package:gd1_d_1686/isiLogo.dart';
import 'package:gd1_d_1686/utilities/constant.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
    Widget build(BuildContext context)  {
      return SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 16, 176, 88),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const ShowProfile()),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/download.jpg'),
                    ),
                  ),
                  const Text(
                    'Natania Regina C.S.',
                    style: kTextStyle1,
                  ),
                  const Text(
                    '220711686',
                    style: kTextStyle5,
                  ),
                  kSizeBox,
                  const Isilinktree(),
                  kSizeBox,
                  const IsiLogo(),
              ],
            ),
          ),
        ),
      );
    }
  }

