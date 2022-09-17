import 'package:flutter/material.dart';
import 'Screens/show_data.dart';
import 'package:get/get.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.textFontSize,
    required this.btitle,
    required this.show,
    required this.abtitle,
  }) : super(key: key);

  final double textFontSize;
  final String btitle;
  final String abtitle;
  final List<Widget> show;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () {
          Get.to(
            ShowData(
              show: show,
              title: abtitle,
            ),
          );
        },
        child: Text(
          btitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: textFontSize,
              fontFamily: "Uchen",
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
