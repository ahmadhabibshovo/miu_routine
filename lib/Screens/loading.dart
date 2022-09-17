import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
   const Loading({Key? key, required this.text}) : super(key: key);
  final text;
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final TextEditingController nameController = TextEditingController();

  bool spin = true;

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.text;
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
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
                      autofocus: true,
                      controller: nameController,
                      textCapitalization: TextCapitalization.characters,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Batch NO or Teachers ID',
                        hintText: 'Enter Your Batch No Or Teachers ID',
                      ),
                    ),
                  ),
                  if (spin)
                    const SpinKitWave(
                      color: Color.fromARGB(182, 12, 119, 235),
                      size: 50.0,
                    ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      textColor: Colors.white,
                      color: Colors.green,
                      child: const Text('Submit'),
                      onPressed: () async {}),
                ],
              ))),
    );
  }
}
