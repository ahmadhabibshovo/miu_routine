import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miu_routine/Screens/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navigator.dart';
import 'dart:async';
import 'loading.dart';
String? path;

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final TextEditingController nameController = TextEditingController();
  
 Future getValidationData() async {
    final prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString("filepath");
    setState(() {
      path = userId;
    });
  }
@override
void initState() {
getValidationData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home:  path ==null ? Center(
          child: Scaffold(
              body: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/nointernet.png'),
                    const Text("You are offline"),
                    const Text("Please Connect to internet and re Open the App"),
                  ],
                ),
              ),
            ),
        )
        :Scaffold(
          appBar: AppBar(
            title: const Text('CSE Routine'),
          ),
          body: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: nameController,
                      textCapitalization: TextCapitalization.characters,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Batch NO or Teachers ID',
                        hintText: 'Enter Your Batch No Or Teachers ID',
                      ),
                    ),
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      textColor: Colors.white,
                      color: Colors.green,
                      child: const Text('Submit'),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString('ID', nameController.text);
                        // ignore: use_build_context_synchronously
                        Get.offAll(Loading(text: nameController.text));
                        Future.delayed(const Duration(milliseconds: 1500), () {
                           Get.offAll(const Navigate());
                        });
                      }),
                ],
              ))),
    );
  }
}
