import '../controllers/controller.dart';

class Worksheets extends WorksheetManager {
  List<Worksheet> worksheets;

  Worksheets({required this.worksheets});

  @override
  void addWorksheet(Worksheet worksheet) {
    worksheets.add(worksheet);
  }

  @override
  void editWorksheet(Worksheet worksheet) {
    worksheets[worksheets.indexWhere(
            (element) => element.workEmployeeId == worksheet.workEmployeeId)] =
        worksheet;
  }

  @override
  Worksheet? getWorksheet(String empId) {
    return worksheets.where((element) => element.workEmployeeId == empId).first;
  }

  @override
  void deleteWorksheet(int worksheetId) {
    var worksheet =
        worksheets.where((element) => element.workID == worksheetId).first;
    worksheets.remove(worksheet);
  }

  @override
  String toString() => 'Worksheets: $worksheets';
}

class Worksheet {
  final String workEmployeeId;
  final String workID;
  final String workDate;
  final DateTime timeIn;
  DateTime? timeOut;

  Worksheet(
    this.workEmployeeId,
    this.workID,
    this.workDate,
    this.timeIn,
    this.timeOut,
  );

  @override
  String toString() {
    return '\n EmployeeID: $workEmployeeId \nWorkID: $workID \nWork Date: $workDate \nTimeIn: $timeIn \nTimeOut: $timeOut \n***************************************************';
  }
}
