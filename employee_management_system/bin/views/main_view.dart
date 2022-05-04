import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import '../models/employee.dart';
import '../models/leave.dart';
import '../models/user.dart';
import '../models/worksheet.dart';

class MainView {
  String uid = '';
  List<User> userList = [];
  List<Employee> listEmployees = [];
  List<Leave> listLeaves = [];
  static List<Worksheet> listWorksheet = [];

  String userId = '';
  String password = '';
  late bool userExist;

  void initDb() {
    DateTime now = DateTime.now();
    var nWorkDate = DateTime(now.year, now.month, now.day).toString();

    //INITIALIZE USERS
    User user1 = User(
      userId: 'r',
      password: 'a',
      isAdmin: true,
    );

    User user2 = User(
      userId: 'R067649',
      password: 'password3',
      isAdmin: false,
    );

    User user3 = User(
      userId: 'a123456',
      password: 'password3',
      isAdmin: false,
    );

    userList.add(user1);
    userList.add(user2);
    userList.add(user3);

    Employee employee1 = Employee(
      employeeID: 'r',
      firstName: 'a',
      lastName: 'Capidos',
      address: 'Cavite',
      phoneNumber: '8565954',
      emailAddress: 'email@email.com',
    );

    Employee employee2 = Employee(
      employeeID: 'R067649',
      firstName: 'John',
      lastName: 'Smith',
      address: 'Makati',
      phoneNumber: '8565954',
      emailAddress: 'email@email.com',
    );

    Employee employee3 = Employee(
      employeeID: 'a123456',
      firstName: 'a',
      lastName: 'Capidos',
      address: 'Cavite',
      phoneNumber: '8565954',
      emailAddress: 'email@email.com',
    );

    listEmployees.add(employee1);
    listEmployees.add(employee2);
    listEmployees.add(employee3);

    DateTime leaveStartDate1 = DateTime.parse('2022-05-05 00:00:00');
    DateTime leaveEndDate1 = DateTime.parse('2022-05-10 00:00:00');

    Leave leave1 = Leave(
      leaveEmployeeId: 'r',
      leaveId: 'leave r ${DateTime.now().day}',
      leaveType: 'Vacation',
      leaveStart: leaveEndDate1,
      leaveEnd: leaveEndDate1,
      leaveDesription: 'boracay',
    );

    Leave leave2 = Leave(
      leaveEmployeeId: 'a123456',
      leaveId: 'leave r ${DateTime.now().day}',
      leaveType: 'Vacation',
      leaveStart: leaveEndDate1,
      leaveEnd: leaveEndDate1,
      leaveDesription: 'boracay',
    );

    Leave leave3 = Leave(
      leaveEmployeeId: 'r',
      leaveId: 'leave r ${DateTime.now().day}',
      leaveType: 'Vacation',
      leaveStart: leaveEndDate1,
      leaveEnd: leaveEndDate1,
      leaveDesription: 'boracay',
    );

    listLeaves.add(leave1);
    listLeaves.add(leave2);
    listLeaves.add(leave3);

    //add initial worksheet
    Worksheet worksheet1 = Worksheet(
      'r',
      'r${DateTime.now().day}',
      nWorkDate,
      now,
      now.add(Duration(hours: 9)),
    );

    Worksheet worksheet2 = Worksheet(
      'a123456',
      'r${DateTime.now().day}',
      nWorkDate,
      now,
      now.add(Duration(hours: 9)),
    );

    Worksheet worksheet3 = Worksheet(
      'R067649',
      'r${DateTime.now().day}',
      nWorkDate,
      now,
      now.add(Duration(hours: 9)),
    );

    listWorksheet.add(worksheet1);
    listWorksheet.add(worksheet2);
    listWorksheet.add(worksheet3);

    print(listEmployees);
    print(listLeaves);
    print(listWorksheet);

    // print(userList);
  }

  void initializeEmployees() {}

  void mainMenu() {
    initDb();
    initializeEmployees();
    print(userList);
    print(listEmployees);
    print('\x1B[94');
    print('E E M P L O Y E E   M A N A G E M E N T  S Y S T E M***');
    print('What would you like to do?');
    print('\n[0] - Login \n[1] - Create Account ');

    int menu = int.parse(stdin.readLineSync(encoding: utf8).toString());
    menu == 0 ? loginUser() : createUser();

    int read1 = int.parse(stdin.readLineSync(encoding: utf8).toString());
  }

  void employeeMenu(String empId) {
    print('What would you like to do?');
    print('\n[0] - Account \n[1] - Worksheet \n[2] - Leaves \n[3] - Log Out');
    int menu = int.parse(stdin.readLineSync(encoding: utf8).toString());

    switch (menu) {
      case 0:
        editAccount(empId);
        break;
      case 1:
        worksheetMenu(empId);
        break;

      case 2:
        showLeaveMenu(empId);
        break;

      case 3:
        logOutUser();
        break;

      case 4:
        break;

      default:
    }
  }

  //LOGIN DETAILS

  String getLoginId() {
    print("Please enter your USER ID");
    userId = stdin.readLineSync(encoding: utf8).toString();
    // uid = int.parse(userId);
    return userId.toString();
  }

  String getPassword() {
    print("Now, please enter your password");
    password = stdin.readLineSync(encoding: utf8).toString();
    return password;
  }

  void loginUser() {
    print("***** ACCESS REQUIRED *******");
    getLoginId();
    verifyLogin();
  }

  void verifyLogin() {
    Users users = Users(users: userList);
    userExist = users.userExist(userId);
    if (userExist == false) {
      print('$userId does not exist!!!, what would you like to do?');
      print('[0] Try Again \n[1] Create New User');

      int optionUser = int.parse(stdin.readLineSync(encoding: utf8).toString());
      optionUser == 0 ? loginUser() : createUser();
    } else {
      print(userExist);
      print('get password');
      getPassword();
      verifyPassword();
    }
  }

  void verifyPassword() {
    //check password
    // print('USER: ${users.getUser(userId)}');
    Users users = Users(users: userList);
    String? retrievedUserPassword = users.getUser(userId)?.password.toString();
    if (retrievedUserPassword.toString() == password) {
      print('Welcome $userId');
      showMyDetails(userId);
      employeeMenu(userId);
    } else {
      print('Password is incorrect ');
      getPassword();
    }
  }

  void showMyDetails(String id) {
    // showAllEmployees();
    Employees employees = Employees(employees: listEmployees);
    print('E M P L O Y E E   M A N A G E M E N T  S Y S T E M***');
    print('My Employment Details ${employees.getEmployee(id)}');
  }

  //MANAGE ACCOUNT

  void createUser() {
    // will do later
    print("Create New User");

    print("Enter UserId/EmployeeId");
    var nUserId = stdin.readLineSync(encoding: utf8).toString();
    print("Enter Password");
    var nPassword = stdin.readLineSync(encoding: utf8).toString();
    print("Enter First Name");
    var nFirstName = stdin.readLineSync(encoding: utf8).toString();
    print("Enter Last Name");
    var nLastName = stdin.readLineSync(encoding: utf8).toString();
    print("Enter Address");
    var nAddress = stdin.readLineSync(encoding: utf8).toString();
    print("Enter Phone Number");
    var nPhoneNumber = stdin.readLineSync(encoding: utf8).toString();
    print("Enter Email Address");
    var nEmail = stdin.readLineSync(encoding: utf8).toString();

    User user1 = User(
      userId: nUserId,
      password: nPassword,
      isAdmin: false,
    );

    userList.add(user1);
    Users users = Users(users: userList);
    users.createUser(user1);
    print(userList);

    Employee employee1 = Employee(
      employeeID: nUserId,
      firstName: nFirstName,
      lastName: nLastName,
      address: nAddress,
      phoneNumber: nPhoneNumber,
      emailAddress: nEmail,
    );

    listEmployees.add(employee1);
    Employees employees = Employees(employees: listEmployees);
    employees.addEmployee(employee1);
    // print(employees);
    mainMenu();
  }

  void editAccount(String id) {
    Employees employees = Employees(employees: listEmployees);

    // print("Enter employee id to edit:");
    // var line = stdin.readLineSync(encoding: utf8);
    // stdout.writeln(line);
    // RETRIEVE AN EMPLOYEE FIRST

    print(employees.getEmployee(id.toString()));

    var retrievedEmployee = employees.getEmployee(id.toString());

    print("Enter the FIELD NUMBER [0] to edit");
    var fieldToEdit = stdin.readLineSync(encoding: utf8);
    print("Enter new value for $fieldToEdit");
    var newValue = stdin.readLineSync(encoding: utf8).toString();

    switch (int.parse(fieldToEdit.toString())) {
      case 0:
        print("EmployeeId can't be udpated");
        break;
      case 1:
        retrievedEmployee.firstName = newValue;
        break;
      case 2:
        retrievedEmployee.lastName = newValue;
        break;
      case 3:
        retrievedEmployee.address = newValue;
        break;
      case 4:
        retrievedEmployee.phoneNumber = newValue;
        break;
      case 5:
        retrievedEmployee.emailAddress = newValue;
        break;
      // case 6:
      //   retrievedEmployee.userId = newValue;
      //   break;
      // case 7:
      //   retrievedEmployee.password = newValue;
      //   break;
      default:
    }

    print(retrievedEmployee);
    employees.editEmployee(retrievedEmployee);
    employeeMenu(id);
  }

  ///LEAVES MENU

  void showLeaveMenu(String id) {
    print('LEAVES');
    showLeaves(id);

    print('\n[0] - Add Leave \n[1] - Edit Leave \n[2] - Main Menu ');

    int menu = int.parse(stdin.readLineSync(encoding: utf8).toString());
    switch (menu) {
      case 0:
        addLeave(id);
        break;
      case 1:
        addLeave(id);
        break;
      case 2:
        employeeMenu(id);
        break;
      default:
    }
  }

  void addLeave(String id) {
    final DateFormat formatter = DateFormat('MM/dd/yyyy');
    print("Enter Leave Type");
    var nLeaveType = stdin.readLineSync(encoding: utf8).toString();

    print("Enter Leave Start e.g. 2022-05-03");
    var nLeaveStart = stdin.readLineSync(encoding: utf8).toString();

    print("Enter Leave End e.g. 2022-05-03");
    var nLeaveEnd = stdin.readLineSync(encoding: utf8).toString();

    print("Comments");
    var nLeaveDescription = stdin.readLineSync(encoding: utf8).toString();

    // print(formatter.format(leaveStart));
    // formatter.format(nLeaveStart);
    DateTime leaveStart = DateTime.parse('$nLeaveStart 00:00:00.000');
    DateTime leaveEnd = DateTime.parse('$nLeaveEnd 00:00:00.000');

    Leave leave = Leave(
      leaveEmployeeId: id,
      leaveId: 'leave $id ${DateTime.now().day}',
      leaveType: nLeaveType,
      leaveStart: leaveStart,
      leaveEnd: leaveEnd,
      leaveDesription: nLeaveDescription,
    );

    listLeaves.add(leave);
    print("Succesfully filed a leave, enjoy your vacation");
    print(leave);
    showLeaves(id);
    showLeaveMenu(id);
  }

  void editLeave(String id) {
    //show list of leaves for employees
  }

  void showLeaves(String empId) {
    List<Leave> empListLeaves = listLeaves
        .where((element) => element.leaveEmployeeId == empId)
        .toList();

    Leaves empLeaves = Leaves(leaves: empListLeaves);
    print(empLeaves);
    // showLeaveMenu(empId);
  }

  void logOutUser() {
    mainMenu();
  }

  //WORKSHEET

  void worksheetMenu(String id) {
    getWorksheets(id);

    print('\n[0] - Time In \n[1] - Time Out \n[2] - Main Menu ');

    int menu = int.parse(stdin.readLineSync(encoding: utf8).toString());
    switch (menu) {
      case 0:
        createWorksheet(id);
        break;
      case 1:
        updateWorksheet(id);
        break;
      case 2:
        employeeMenu(id);
        break;
      default:
    }
  }

  void getWorksheets(String id) {
    List<Worksheet> employeeWorksheets =
        listWorksheet.where((element) => element.workEmployeeId == id).toList();
    print(employeeWorksheets);
  }

  void createWorksheet(String empId) {
    DateTime now = DateTime.now();
    var getDate =
        DateTime.fromMillisecondsSinceEpoch(now.microsecondsSinceEpoch)
            .toString();
    var nWorkId = '$empId$getDate';
    var nWorkEmployeeId = empId;

    var nWorkDate = DateTime(now.year, now.month, now.day).toString();
    // var nWorkDate = formatter.format(now);

    Worksheet ws = Worksheet(
      empId,
      nWorkId,
      nWorkDate,
      now,
      null,
    );

    Worksheets worksheets = Worksheets(worksheets: listWorksheet);
    worksheets.addWorksheet(ws);
    print(worksheets);
    employeeMenu(empId);
  }

  void updateWorksheet(String id) {
    Worksheets worksheets = Worksheets(worksheets: listWorksheet);
    var retrievedWs = worksheets.getWorksheet(id);
    Worksheet ws = Worksheet(
      retrievedWs!.workEmployeeId,
      retrievedWs.workID,
      retrievedWs.workDate,
      retrievedWs.timeIn,
      DateTime.now(),
    );

    ws.timeOut = DateTime.now();

    if (retrievedWs.timeOut == null) {
      worksheets.editWorksheet(ws);
      print(worksheets);
    }
  }
}
