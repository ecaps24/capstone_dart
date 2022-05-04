import '../controllers/controller.dart';
import 'package:collection/collection.dart';

class User {
  final String userId;
  String password;
  bool isAdmin;

  User({
    required this.userId,
    required this.password,
    required this.isAdmin,
  });

  @override
  String toString() {
    return '\n[0] - userId: $userId \n[1] - Password: $password  \n[3] - isAdmin: $isAdmin\n***************************************************';
  }
}

class Users extends UserManager {
  List<User> users;

  Users({required this.users});

  @override
  void createUser(User user) {
    users.add(user);
  }

  @override
  bool userExist(String userId) {
    // var r = users.where((element) => element.userId == userId).first;
    // return users.isNotEmpty;

    return (users.firstWhereOrNull((element) => element.userId == userId)) ==
            null
        ? false
        : true;
    // return result == null ? false : true;
    // return users.firstWhereOrNull((element) => element.userId == userId);
    // print(u.hashCode);
    // return users.firstWhere((element) => element.userId == userId,
    //     orElse: () => false);
    // return users.contains(u) ? true : false;
  }

  @override
  User? getUser(String userId) {
    return users.where((element) => element.userId == userId).first;
  }

  @override
  String toString() {
    return '\n[0] - USERS: $users';
  }
}
