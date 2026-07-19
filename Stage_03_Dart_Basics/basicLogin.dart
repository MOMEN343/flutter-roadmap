import 'dart:io';

void main() {
  Map<String, String> users = {"admin": "123", "Momen343": "343"};
  print("============ Basig Login ============");
  while (true) {
    print("options List: ");
    print("1 - Login");
    print("2 - Register");
    print("3 - Change password");
    print("4 - Exit");
    print("Please enter your option: ");

    int option = int.parse(stdin.readLineSync()!);

    if (option < 1 || option > 4) {
      print("Please enter a valid option");
      continue;
    } else if (option == 4) {
      print("Thank you for using our system. Goodbye <3");
      break;
    }

    switch (option) {
      case 1:
        print("Enter username: ");
        String userName = stdin.readLineSync()!;
        if (users.containsKey(userName)) {
          print("Enter password: ");
          String password = stdin.readLineSync()!;
          if (users[userName] == password) {
            print("Welcom $userName you are logged in!");
            if (userName == "admin") {
              adminPanel(users);
            }
          } else {
            print("Wrong password");
          }
        } else {
          print("username not found");
        }
        break;
      case 2:
        registerUser(users);
        break;
      case 3:
        print("Enter your username: ");
        String username = stdin.readLineSync()!;
        if (users.containsKey(username)) {
          print("Enter a new password: ");
          String newPassword = stdin.readLineSync()!;
          if (users[username] == newPassword) {
            print("It's the same password! please enter a new one.");
          } else {
            users[username] = newPassword;
            print("Password changed successfully");
          }
        } else {
          print("User not found!");
        }
    }
  }
}

registerUser(Map<String, String> users) {
  print("Please enter a username: ");
  String newUserName = stdin.readLineSync()!;
  if (users.containsKey(newUserName)) {
    print("username already exists! try anoter one");
  } else {
    print("Please enter a password: ");
    String newPassword = stdin.readLineSync()!;
    users[newUserName] = newPassword;
    print("user registerd successfully");
  }
}

void adminPanel(Map<String, String> users) {
  print("============ Admin Page ===========");
  while (true) {
    print("admin list options: ");
    print("1 - add new user.");
    print("2 - delete user");
    print("3 - Show users");
    print("4 - Exit");
    print("Enter your option: ");
    int option = int.parse(stdin.readLineSync()!);
    if (option < 1 || option > 4) {
      print("Invalid option");
      continue;
    } else if (option == 4) {
      break;
    }
    switch (option) {
      case 1:
        registerUser(users);
        break;
      case 2:
        List userNames = users.keys.toList();
        for (int i = 0; i < userNames.length; i++) {
          print("${i + 1} - ${userNames[i]}");
        }
        print("Enter user number to delete: ");
        int userIndex = int.parse(stdin.readLineSync()!) - 1;
        if (userNames[userIndex] == "admin") {
          "You can't delete admin";
        } else if (userIndex < userNames.length) {
          users.remove(userNames[userIndex]);
          print("User deleted successfully");
        } else {
          print("Numer out of range");
        }
        break;
      case 3:
        List userNames = users.keys.toList();
        for (int i = 0; i < userNames.length; i++) {
          print("${i + 1} - ${userNames[i]}");
        }
        break;
    }
  }
}
