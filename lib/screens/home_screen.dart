import 'package:doctors_appointments/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget{

  List catNames = [
    "Dental",
    "Heart",
    "Eye",
    "Brain",
    "Ear",
  ];

  List<Icon> catIcons = [
    Icon(MdiIcons.toothOutline, color: pColor, size: 30,),
    Icon(MdiIcons.heartPlus, color: pColor, size: 30,),
    Icon(MdiIcons.eye, color: pColor, size: 30,),
    Icon(MdiIcons.brain, color: pColor, size: 30,),
    Icon(MdiIcons.earHearing, color: pColor, size: 30,),
  ];
  
  @override
  Widget build(BuildContext context){
    return Material(
      color: Color(0xFFD9E4EE),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    pColor.withOpacity(0.8),
                    pColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 30, 
                            backgroundImage: 
                            AssetImage("images/man.png"),
                          ),
                          Icon(
                            Icons.notifications_outlined,
                            color: wColor,
                            size: 30,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Hi, programmer",
                        style: TextStyle(
                          color: wColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Your Health is Our\nFirst Priority",
                        style: TextStyle(
                          color: wColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: wColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: sdColor,
                              blurRadius: 6,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}