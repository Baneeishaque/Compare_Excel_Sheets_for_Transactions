import 'dart:io';
import 'package:excel/excel.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';

//int calculate() {
//  return 6 * 7;
//}

void readExcelFile() {
  var file = r'bin\4356XXXXXXXXX854509-03-2020.xls';
  var bytes = File(file).readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  for (var table in excel.tables.keys) {
    print(table); //sheet Name
    print(excel.tables[table].maxCols);
    print(excel.tables[table].maxRows);
    for (var row in excel.tables[table].rows) {
      print("$row");
    }
  }
}

void readExcelFileUsingSpreadSheetDecoder() {
  var file = r'bin\4356XXXXXXXXX854509-03-2020.xls';
  var bytes = File(file).readAsBytesSync();
  var decoder = SpreadsheetDecoder.decodeBytes(bytes, update: true);
  for (var table in decoder.tables.keys) {
    print(table);
    print(decoder.tables[table].maxCols);
    print(decoder.tables[table].maxRows);
    for (var row in decoder.tables[table].rows) {
      print('$row');
    }
  }
}
