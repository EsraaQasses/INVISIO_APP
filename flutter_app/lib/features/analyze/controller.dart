import 'dart:convert';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'package:excel/excel.dart';

class AnalyzeController extends GetxController {
  var jsonResult = ''.obs;
  Future<void> pickAndConvertFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', 'xlsx', 'xls'],
    );
    if (result != null) {
      final file = result.files.first;
      final Uint8List? fileBytes = file.bytes;
      final String? extension = file.extension;

      if (fileBytes == null || extension == null) return;

      if (extension == 'csv') {
        _processCSV(fileBytes);
      } else if (extension == 'xlsx' || extension == 'xls') {
        // _processExcel(fileBytes);
      }
    }
  }

  void _processCSV(Uint8List fileBytes) {
    final content = String.fromCharCodes(fileBytes);

    // هنا نستخدم `CsvToListConverter` بشكل صحيح لقراءة الفاصل بشكل صحيح
    List<List<dynamic>> rows =
        const CsvToListConverter().convert(content, fieldDelimiter: ',');

    if (rows.isEmpty) return;

    // استخراج الرؤوس من الصف الأول
    List<String> headers = rows.first.map((e) => e.toString()).toList();
    List<Map<String, dynamic>> jsonList = [];

    // معالجة الصفوف الأخرى
    for (int i = 1; i < rows.length; i++) {
      Map<String, dynamic> rowMap = {};
      for (int j = 0; j < headers.length; j++) {
        rowMap[headers[j]] = rows[i][j]; // إضافة البيانات مع الرأس المناسب
      }
      jsonList.add(rowMap);
    }

    jsonResult.value = jsonEncode(jsonList); // تحديث النتيجة لتكون JSON
  }

  // void _processExcel(Uint8List fileBytes) {
  //   try {
  //     var excel = Excel.decodeBytes(fileBytes);
  //     Map<String, List<Map<String, dynamic>>> finalJson = {};

  //     // التأكد من وجود أوراق عمل في الملف
  //     for (var table in excel.tables.keys) {
  //       var sheet = excel.tables[table];
  //       if (sheet == null || sheet.rows.isEmpty) {
  //         continue;
  //       }

  //       List<List<Data?>> rows = sheet.rows;
  //       if (rows.isEmpty) continue;

  //       // استخراج الرؤوس من أول صف
  //       List<String> headers =
  //           rows.first.map((e) => e?.value.toString() ?? "").toList();
  //       List<Map<String, dynamic>> data = [];

  //       // معالجة البيانات من الصفوف التالية
  //       for (int i = 1; i < rows.length; i++) {
  //         Map<String, dynamic> rowMap = {};
  //         for (int j = 0; j < headers.length; j++) {
  //           rowMap[headers[j]] = rows[i][j]?.value;
  //         }
  //         data.add(rowMap);
  //       }

  //       finalJson[table] = data;
  //     }

  //     // إذا كانت هناك بيانات سيتم تحويلها إلى JSON
  //     jsonResult.value = jsonEncode(finalJson);
  //   } catch (e) {
  //     // في حال حدوث خطأ أثناء المعالجة
  //     jsonResult.value = ' error prossing Excel: $e';
  //  }
  // }
}
