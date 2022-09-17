import 'package:flutter/material.dart';

import 'Packages/download_file.dart';
import 'package:get/get.dart';
import 'Screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Main());
  await GetFiles.getFile(
      "https://drive.google.com/uc?export=download&id=1rWZJHbGmYTSI5wiXZSZ7o0gDVuDuyB3J",
      "ex.xlsx");
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashPage(),
    );
  }
}
