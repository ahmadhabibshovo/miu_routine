import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key, required this.show, required this.title})
      : super(key: key);
  final List<Widget> show;
  final String title;
  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 9,
              child: widget.show.isNotEmpty
                  ? ListView(
                      padding: const EdgeInsets.all(10), children: widget.show)
                  : const Text(
                      'Have A Relax \n No Class Today',
                      style: TextStyle(fontSize: 20),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
