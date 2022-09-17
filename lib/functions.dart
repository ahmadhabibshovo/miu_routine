import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'global.dart' as globe;

void addRoutine(dayRoutineText, List<Widget> dayRoutineWidgets) {
  for (int i = 0; i < dayRoutineText.length; i++) {
    dayRoutineWidgets.add(
      Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: HexColor("#3488FF"),
        ),
        child: Center(
            child: Text(dayRoutineText[i],
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Uchen",
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}

void addData(
    String day, String time, String room, String cell, String dayS, store) {
  if (cell.contains("/${globe.batch}") || cell.contains("${globe.batch}/")) {
    if (day.contains(dayS)) {
      String margevalue = "$time  Room: $room \n$cell ";
      if (int.parse(margevalue[0]) < 9) {
        margevalue = ">$margevalue";
      }
      store.add(margevalue);
      store.sort();
    }
  }
}

void addDataEmpty(String day, String time, String room, String dayS, store) {
  if (room[0] == "C") {
    if (day.contains(dayS)) {
      String margevalue = "$time    \nRoom: $room  ";
      if (int.parse(margevalue[0]) < 9) {
        margevalue = ">$margevalue";
      }
      store.add(margevalue);
      store.sort();
    }
  }
}

getString(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var categoryList = prefs.getStringList(value);
  return categoryList;
}

Future<bool?> getID() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool("ID", false);
  final bool? id = prefs.getBool('ID');
  return id;
}

launchURL() async {
  const url = 'https://ahmadhabibshovo.github.io/#section-contact';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
