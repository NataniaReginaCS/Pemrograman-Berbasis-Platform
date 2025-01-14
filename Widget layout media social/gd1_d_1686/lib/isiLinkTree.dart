import 'package:flutter/material.dart';
import 'package:gd1_d_1686/elementLinkTree.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gd1_d_1686/service/directToLink.dart';
// import 'package:gd1_d_1686/isiBaru.dart';

class Isilinktree extends StatefulWidget {
  const Isilinktree({super.key});

  @override
  State<Isilinktree> createState() => _IsiLinkTreeState();
}

class _IsiLinkTreeState extends State<Isilinktree> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardForlinkTree(
          icon: Icons.phone, 
          text: '+62 896 1849 2967',
        ),
        const CardForlinkTree(
          icon: Icons.email, 
          text: '220711686@students.uajy.ac.id',
        ),
        CardForlinkTree(
          icon: FontAwesomeIcons.instagram, 
          text: 'Instagram',
          onPressed: () {
            Direct.launchURL('https://www.instagram.com/');
          },
        ),
        CardForlinkTree(
          icon: FontAwesomeIcons.facebook, 
          text: 'Facebook',
          onPressed: () {
            Direct.launchURL('https://www.facebook.com/');
          },
        ),
        CardForlinkTree(
          icon: FontAwesomeIcons.tiktok, 
          text: 'Tiktok',
          onPressed: () {
            Direct.launchURL('https://www.tiktok.com/');
          },
        ),
      ],
    );
  }
}