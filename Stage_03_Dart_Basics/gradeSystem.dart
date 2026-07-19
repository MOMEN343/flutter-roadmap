import 'dart:io';

void main() {
  Map<String, int> studentGrades = {
    "Momen": 89,
    "Motasem": 95,
    "Mousa": 69,
    "Ismael": 80,
    "Mohammed": 100,
  };
  print("========== Studnt Grade System ==========");
  while (true) {
    print("please select an option: ");
    print("1 - Record a grade");
    print("2 - Edit a grade");
    print("3 - Delete student");
    print("4 - Show student report");
    print("5 - Show the grade record.");
    print("6 - Exit");
    print("Enter your choise: ");
    int option = int.parse(stdin.readLineSync()!);
    if (option > 6 || option < 1) {
      print("Invaild number");
      continue;
    } else if (option == 6) {
      print("Thank you for using our system <3. Goodbye!");
      break;
    }
    switch (option) {
      case 1:
        print("PLease Enter student name: ");
        String studentName = stdin.readLineSync()!;
        if (studentGrades.containsKey(studentName)) {
          print("Student already exists");
        } else {
          print("Please Enter Student Grade: ");
          int grade = int.parse(stdin.readLineSync()!);
          if (grade >= 0 && grade <= 100) {
            studentGrades[studentName] = grade;
            print("grade for $studentName recorded successfully");
          } else {
            print("Invalid grade");
          }
        }
        break;
      case 2:
        printGradesRecord(studentGrades);
        print("Please Enter the name of the student to edit: ");
        String studentName = stdin.readLineSync()!;
        if (studentGrades.containsKey(studentName)) {
          print("New grade: ");
          int newGrade = int.parse(stdin.readLineSync()!);
          if (newGrade >= 0 && newGrade <= 100) {
            studentGrades[studentName] = newGrade;
            print("student grade updated successfully");
          } else {
            print("Invalid grade");
          }
        } else {
          print("Student not found");
        }

        break;
      case 3:
        print("Please Enter student name: ");
        String studentName = stdin.readLineSync()!;
        if (studentGrades.containsKey(studentName)) {
          studentGrades.remove(studentName);
          print("$studentName removed sucessfully");
        } else {
          print("Student not found.");
        }
        break;
      case 4:
        print("please Enter student name ");
        String studentName = stdin.readLineSync()!;
        if (studentGrades.containsKey(studentName)) {
          int studentGrade = studentGrades[studentName]!;
          printStudentReport(studentName, studentGrade);
        } else {
          print("Student not found");
        }
        break;
      case 5:
        printGradesRecord(studentGrades);
        break;
    }
  }
}

String letterGrade(int grade) {
  if (grade >= 90) {
    return "A";
  } else if (grade >= 80) {
    return "B";
  } else if (grade >= 70) {
    return "C";
  } else if (grade >= 60) {
    return "D";
  } else {
    return "F";
  }
}

void printGradesRecord(Map<String, int> studentGrades) {
  print("\nGrades Record: ");
  print("====================");
  List<String> names = studentGrades.keys.toList();
  List<int> grades = studentGrades.values.toList();
  print("${"Name".padRight(10)} | Grade");
  print("====================");

  for (int i = 0; i < names.length; i++) {
    print("${names[i].padRight(10)} | ${grades[i]}");
  }
  print("====================");
  print("\n");
}

String status(int studentGrade) {
  if (studentGrade >= 60) {
    return "Pass";
  } else {
    return "Fail";
  }
}

void printStudentReport(String studentName, int studentGrade) {
  print("============ ${studentName} Report ============");
  print("Student Name   |   $studentName");
  print("Student Grade  |   $studentGrade");
  print("Letter Grade   |   ${letterGrade(studentGrade)}");
  print("status         |   ${status(studentGrade)}");

  print(
    "=============${List.filled(studentName.length, "=").join()}====================",
  );
}
