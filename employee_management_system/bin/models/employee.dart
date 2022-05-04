import '../controllers/controller.dart';
import 'user.dart';

class Employee extends User {
  final String employeeID;
  String firstName;
  String lastName;
  String address;
  String phoneNumber;
  String emailAddress;

  // bool admin;

  Employee({
    required this.employeeID,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.phoneNumber,
    required this.emailAddress,
  }) : super(userId: '', password: '', isAdmin: false);

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        employeeID: json['employeeID'] as String,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        address: json['address'] as String,
        phoneNumber: json['phoneNumber'] as String,
        emailAddress: json['emailAddress'] as String,
      );

  String toStringMenu() {
    return '\n[0] - EmployeeID: $employeeID \n[1] - FirstName: $firstName \n[2] - LastName: $lastName \n[3] - Address: $address \n[4] - Phone: $phoneNumber \n[5] - Email: $emailAddress \n[6] - IsAdmin: $isAdmin \n[7] - password: $password  \n***************************************************';
  }

  @override
  String toString() {
    return '\n[0] - EmployeeID: $employeeID \n[1] - FirstName: $firstName \n[2] - LastName: $lastName \n[3] - Address: $address \n[4] - Phone: $phoneNumber \n[5] - Email: $emailAddress, \n[6] - IsAdmin: $isAdmin \n[7]  \n***************************************************';
    // return '\n EmployeeID: $employeeID \nFirstName: $firstName \nLastName: $lastName \nAddress: $address \nPhone: $phoneNumber \nEmail: $emailAddress \nIsAdmin: $isAdmin \npassword: $password  \n***************************************************';
  }
}

class Employees extends ManageEmployee {
  List<Employee> employees;

  Employees({required this.employees});

  @override
  void addEmployee(Employee e) {
    employees.add(e);
  }

  @override
  void deleteEmployee(String e) {
    var emp = employees.where((element) => element.employeeID == e).first;
    employees.remove(emp);
  }

  @override
  void editEmployee(Employee e) {
    employees[employees
        .indexWhere((element) => element.employeeID == e.employeeID)] = e;
    // var emp = employees.where((element) => element.employeeID == e).first;
  }

  @override
  Employee getEmployee(String e) {
    return employees.where((element) => element.employeeID == e).first;
  }

  @override
  String toString() => 'EMPLOYEES: $employees';
}
