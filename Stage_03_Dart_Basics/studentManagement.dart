import 'dart:io';

void main() {
  print("========== Student Management ==========");
  print("Welcome to the Student Management System");
  print("========================================");
  print("Current Student List:");
  List<String> students = ["Momen", "Motasem", "Mousa", "Ismael", "Mohammed"];
  printList(students);
  print("========================================");
  while (true) {
    print("Please select an option:");
    print("1 - Add a student");
    print("2 - Remove a student");
    print("3 - Edit a student");
    print("4 - View all students");
    print("5 - Exit");
    print("Enter your choice:");
    try {
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 5) {
        print("Thank you for using our system. Goodbye <3");
        break;
      } else if (choice < 1 || choice > 5) {
        print("Invalid choice. Please select a valid option.\n");
        continue;
      }

      switch (choice) {
        case 1:
          print("Enter the name of the student to add:");
          String newStudent = stdin.readLineSync()!;
          if (newStudent.trim().isEmpty) {
            print("Student name can't be empty.");
          } else {
            students.add(newStudent);
            print("$newStudent added successfully.");
            printList(students);
          }
          break;
        case 2:
          print("Enter the number of the student to remove:");
          int removeStudentIndex = int.parse(stdin.readLineSync()!) - 1;
          if (removeStudentIndex >= 0 && removeStudentIndex < students.length) {
            String removedStudent = students[removeStudentIndex];
            students.removeAt(removeStudentIndex);
            print("$removedStudent removed successfully.");
          } else {
            print("Student number is out of range.");
          }
          printList(students);
          break;
        case 3:
          print("Enter the number of the student to edit:");
          int editStudentIndex = int.parse(stdin.readLineSync()!) - 1;
          print("Enter the new name: ");
          String newName = stdin.readLineSync()!;
          if (newName.trim().isEmpty) {
            print("Student name can't be empty");
          } else if (editStudentIndex >= 0 &&
              editStudentIndex < students.length) {
            students[editStudentIndex] = newName;
            print("Student updated successfully.");
          } else {
            print("Student number is out of range.");
          }
          printList(students);
          break;
        case 4:
          printList(students);
          break;
      }
    } catch (e) {
      print("Invalid input. Please enter a valid number.");
    }
  }
}

void printList(List<String> studentList) {
  print("\nStudent List: ");

  for (int i = 0; i < studentList.length; i++) {
    print("${i + 1}. ${studentList[i]}");
  }
  print("\n");
}
