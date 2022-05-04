import '../models/employee.dart';
import '../models/leave.dart';
import '../models/salary.dart';
import '../models/user.dart';
import '../models/worksheet.dart';

abstract class ManageEmployee {
  void addEmployee(Employee e) {}
  void editEmployee(Employee e);
  void deleteEmployee(String e);
  Employee? getEmployee(String e) {}
}

abstract class SalaryManager {
  void addSalary(Salary s) {}
  void editSalary(Salary s) {}
  void deleteSalary(int s) {}
  Salary? getSalary(int e) {}
}

abstract class WorksheetManager {
  void addWorksheet(Worksheet worksheet) {}
  void editWorksheet(Worksheet worksheet) {}
  void deleteWorksheet(int worksheetId) {}
  Worksheet? getWorksheet(String empId) {}
}

abstract class LeaveManager {
  void addLeave(Leave leave) {}
  void editLeave(Leave leave) {}
  void deleteLeave(int leaveId) {}
  Leave? getLeave(int leavedId) {}
}

abstract class UserManager {
  void createUser(User user) {}
  bool userExist(String userId) {
    return false;
  }

  User? getUser(String userId) {}
}
