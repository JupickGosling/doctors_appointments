import 'package:doctors_appointments/category/%D1%81ardiologist.dart';
import 'package:doctors_appointments/category/audiologist.dart';
import 'package:doctors_appointments/category/dental.dart';
import 'package:doctors_appointments/category/neurologist.dart';
import 'package:doctors_appointments/category/oculist.dart';
import 'package:doctors_appointments/category/surgeon.dart';
import 'package:doctors_appointments/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key});

  List catNames = [
    "Стоматол.",
    "Кардиол.",
    "Окулист",
    "Невролог",
    "ЛОР",
    "Хирург",
  ];

  @override
  Widget build(BuildContext context) {
    List<IconButton> catIconB = [
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CatDant(),
            ),
          );
        },
        icon: const Icon(MdiIcons.toothOutline, size: 30, color: pColor),
      ),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CatCardioligost(),
            ),
          );
        },
        icon: const Icon(MdiIcons.heartPlus, size: 30, color: pColor),
      ),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CatOculist(),
            ),
          );
        },
        icon: const Icon(MdiIcons.eye, size: 30, color: pColor),
      ),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CatNeurologist(),
            ),
          );
        },
        icon: const Icon(MdiIcons.brain, size: 30, color: pColor),
      ),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CatAudiologist(),
            ),
          );
        },
        icon: const Icon(MdiIcons.earHearing, size: 30, color: pColor),
      ),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CatSurgeon(),
            ),
          );
        },
        icon: const Icon(MdiIcons.stomach, size: 30, color: pColor),
      ),
    ];
    return Container(
      height: 90,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: catNames.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F8FF),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: sdColor,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Center(
                  child: catIconB[index],
                ),
              ),
              Text(
                catNames[index],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: bColor.withOpacity(0.7),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
