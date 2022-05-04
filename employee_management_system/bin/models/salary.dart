import '../controllers/controller.dart';

class Salary {
  final int salaryId;
  final int salaryEmployeeId;
  double basicSalary;
  String salaryType;
  String salaryDescription;
  double ratePerHour() => (basicSalary / 8);

  Salary({
    required this.salaryId,
    required this.salaryEmployeeId,
    required this.salaryType,
    required this.salaryDescription,
    required this.basicSalary,
  });

  factory Salary.fromJson(Map<String, dynamic> json) => Salary(
      salaryId: json['salaryId'] as int,
      salaryEmployeeId: json['salaryEmployeeId'] as int,
      basicSalary: json['basicSalary'] as double,
      salaryType: json['salaryType'] as String,
      salaryDescription: json['salaryDescription'] as String);

  @override
  String toString() {
    return '\n[0] - SalaryID: $salaryId \n[1] - SalaryEmployeeId: $salaryEmployeeId \n[2] - basicSalary: $basicSalary \n[3] - Address: $salaryType \n[4] - salaryType: $salaryType \n[5] - salaryDescription: $salaryDescription\n***************************************************';
  }
}

class EmployeeSalaries extends SalaryManager {
  List<Salary> salaries;

  EmployeeSalaries({required this.salaries});

  @override
  void addSalary(Salary s) {
    salaries.add(s);
  }

  @override
  void editSalary(Salary s) {
    // TODO: implement editSalary
    super.editSalary(s);
  }

  @override
  void deleteSalary(int s) {
    var salary = salaries.where((element) => element.salaryId == s).first;
    salaries.remove(salary);
  }

  @override
  Salary getSalary(int s) {
    return salaries.where((element) => element.salaryEmployeeId == s).first;
  }

  @override
  String toString() => 'EMPLOYEES SALARIES: $salaries';
}
