import 'package:excel/excel.dart';
import 'dart:io';
import 'package:miu_routine/global.dart' as globe;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:miu_routine/functions.dart';

class GetData {
  static getData() async {
    final prefs = await SharedPreferences.getInstance();
    final filepath = prefs.getString('filepath');
    final String? batch = prefs.getString('ID');
    var excelbytes = File(filepath.toString()).readAsBytesSync();
    var excel = Excel.decodeBytes(excelbytes);
    var sheet = excel['Fall2022'];
    List<String> alpha = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
    globe.updated = sheet.cell(CellIndex.indexByString('J3')).value.toString();
    globe.batch = batch;
    for (int x = 1; x < 50; x++) {
      for (int i = 0; i < 10; i++) {
        String cell = sheet
            .cell(CellIndex.indexByString('${alpha[i]}$x'))
            .value
            .toString();
        String day =
            sheet.cell(CellIndex.indexByString('A$x')).value.toString();
        String time = sheet
            .cell(CellIndex.indexByString('${alpha[i]}4'))
            .value
            .toString();
        String room =
            sheet.cell(CellIndex.indexByString('B$x')).value.toString();
        if (cell != "null") {
          if (cell.contains("/$batch") || cell.contains("$batch/")) {
            addData(day, time, room, cell, "SAT", globe.satRoutine);
            addData(day, time, room, cell, "SUN", globe.sunRoutine);
            addData(day, time, room, cell, "MON", globe.monRoutine);
            addData(day, time, room, cell, "TUE", globe.tueRoutine);
            addData(day, time, room, cell, "WED", globe.wedRoutine);
          }
        } else {
          addDataEmpty(day, time, room, "SAT", globe.satRoutineEmpty);
          addDataEmpty(day, time, room, "SUN", globe.sunRoutineEmpty);
          addDataEmpty(day, time, room, "MON", globe.monRoutineEmpty);
          addDataEmpty(day, time, room, "TUE", globe.tueRoutineEmpty);
          addDataEmpty(day, time, room, "WED", globe.wedRoutineEmpty);
        }
      }
    }
    addRoutine(globe.satRoutine, globe.satRoutineWidgets);
    addRoutine(globe.sunRoutine, globe.sunRoutineWidgets);
    addRoutine(globe.monRoutine, globe.monRoutineWidgets);
    addRoutine(globe.tueRoutine, globe.tueRoutineWidgets);
    addRoutine(globe.wedRoutine, globe.wedRoutineWidgets);
    addRoutine(globe.satRoutineEmpty, globe.satRoutineWidgetsEmpty);
    addRoutine(globe.sunRoutineEmpty, globe.sunRoutineWidgetsEmpty);
    addRoutine(globe.monRoutineEmpty, globe.monRoutineWidgetsEmpty);
    addRoutine(globe.tueRoutineEmpty, globe.tueRoutineWidgetsEmpty);
    addRoutine(globe.wedRoutineEmpty, globe.wedRoutineWidgetsEmpty);
  }
}
