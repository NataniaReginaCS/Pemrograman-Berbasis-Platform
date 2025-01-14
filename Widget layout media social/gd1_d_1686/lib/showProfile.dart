import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gd1_d_1686/isiShowProfile.dart';
import 'package:gd1_d_1686/service/directToLink.dart';
import 'package:gd1_d_1686/utilities/constant.dart';

class ShowProfile extends StatelessWidget {
  const ShowProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          backgroundColor: const Color.fromARGB(255, 6, 105, 51),
        ),
        backgroundColor: kColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    kSizeBox2,
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/download.jpg')),
                    kSizeBox2,
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Natania Regina C.S.', style: kTextStyle5),
                          Text('220711686', style: kTextStyle5),
                        ],
                      ),
                    )
                  ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text('3', style: kTextStyle3),
                        Text('Followers', style: kTextStyle3),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text('3', style: kTextStyle3),
                        Text('Followers', style: kTextStyle3),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text('10', style: kTextStyle3),
                        Text('Following', style: kTextStyle3),
                      ],
                    ),
                  )
                ],
              ),
            ),
            kSizeBox,
            Isishowprofile()
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Direct.launchURL("https://www.linkedin.com/");
            },
            child: const Icon(FontAwesomeIcons.linkedin),
            backgroundColor: Colors.teal,
          ),
          kSizeBox3,
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            label: const Text("Kembali"),
            backgroundColor: Colors.teal,
          ),
        ],
      )),
  );
  }
}