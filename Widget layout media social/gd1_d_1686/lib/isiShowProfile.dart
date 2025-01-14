import 'package:flutter/material.dart';
import 'package:gd1_d_1686/utilities/constant.dart';

class Isishowprofile extends StatefulWidget {
  const Isishowprofile({super.key});

  @override
  State<Isishowprofile> createState() => _IsiShowProfileState();
}

class _IsiShowProfileState extends State<Isishowprofile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 110,
              height: 110,
              color: Colors.white,
              child: Image.asset('images/images1.jpg'),
            ),
            Container(
              width: 110,
              height: 110,
              color:  Colors.white,
              child: Image.asset('images/images2.jpg'),
            ),
            Container(
              width: 110,
              height: 110,
              color: Colors.white,
              child: Image.asset('images/images3.jpg'),
            ),
          ], 
        ),
        kSizeBox3,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 110,
              height: 110,
              color: Colors.white,
              child: Image.asset('images/images4.jpg'),
            ),
            Container(
              width: 110,
              height: 110,
              color:  Colors.white,
              child: Image.asset('images/images5.jpg'),
            ),
            Container(
              width: 110,
              height: 110,
              color: Colors.white,
              child: Image.asset('images/images6.jpg'),
            ),
          ],
        ),
        kSizeBox3,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 110,
              height: 110,
              color: Colors.white,
              child: Image.asset('images/images7.jpg'),
            ),
            Container(
              width: 110,
              height: 110,
              color:  Colors.white,
              child: Image.asset('images/images8.jpg'),
            ),
            Container(
              width: 110,
              height: 110,
              color: Colors.white,
              child: Image.asset('images/images9.jpg'),
            ),
          ],
        ),
        kSizeBox3,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 110,
              height: 110,
              color: Colors.white,
              child: Image.asset('images/images10.jpg'),
            ),
            Container(
              width: 110,
              height: 110,
              color:  Colors.white,
              child: Image.asset('images/images11.jpg'),
            ),
            Container(
              width: 110,
              height: 110,
              color: Colors.white,
              child: Image.asset('images/images12.jpg'),
            ),
          ],
        ),
        kSizeBox3,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 110,
              height: 110,
              color: Colors.white,
              child: Image.asset('images/images13.jpg'),
            ),
            Container(
              width: 110,
              height: 110,
              color:  Colors.white,
              child: Image.asset('images/images14.jpg'),
            ),
            Container(
              width: 110,
              height: 110,
              color: Colors.white,
              child: Image.asset('images/images15.jpg'),
            ),
          ],
        ),
      ],
    );
  }
}