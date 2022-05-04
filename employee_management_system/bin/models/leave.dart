import '../controllers/controller.dart';

class Leave {
  final String leaveEmployeeId;
  final String leaveId;
  String leaveType;
  DateTime leaveStart;
  DateTime leaveEnd;
  String leaveDesription;

  Leave({
    required this.leaveEmployeeId,
    required this.leaveId,
    required this.leaveType,
    required this.leaveStart,
    required this.leaveEnd,
    required this.leaveDesription,
  });

  int daysOnLeave() => leaveEnd.difference(leaveStart).inDays.toInt() + 1;

  @override
  String toString() {
    return '\nEmployee Id: $leaveEmployeeId \nLeave Type: $leaveType \nLeave Start: $leaveStart \nLeave End: $leaveEnd \nDays On Leave: ${daysOnLeave()} \n*******************';
  }
}

class Leaves extends LeaveManager {
  List<Leave> leaves;
  Leaves({required this.leaves});

  @override
  void addLeave(Leave leave) {
    leaves.add(leave);
  }

  @override
  Leave? getLeave(int leavedId) {
    return leaves.where((element) => element.leaveEmployeeId == leavedId).first;
  }

  @override
  void editLeave(Leave leave) {
    leaves[leaves.indexWhere((element) => element.leaveId == leave.leaveId)] =
        leave;
  }

  @override
  void deleteLeave(int leaveId) {
    var leave = leaves.where((element) => element.leaveId == leaveId).first;
    leaves.remove(leave);
  }

  @override
  String toString() {
    return '\n LEAVES: $leaves ********************************';
  }
}

class LeaveType {
  final String type;
  LeaveType(this.type);
}
