import 'dart:io';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetFiles {
  static Future getFile(String url, String fileName) async {
    late bool hasinternet;
    hasinternet = await InternetConnectionChecker().hasConnection;
    if (hasinternet) {
      await downloadFile(url, fileName);
    } else {}
  }

  static Future<File> downloadFile(String url, String fileName) async {
    final prefs = await SharedPreferences.getInstance();
    await InternetConnectionChecker().hasConnection;
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String dir = appDocDir.path;
    await prefs.setString('filepath', "$dir/ex.xlsx");
    var req = await http.Client().get(Uri.parse(url));
    var file = File('$dir/$fileName');
    return file.writeAsBytes(req.bodyBytes, flush: true);
  }
}
