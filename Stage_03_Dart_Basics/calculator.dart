import 'dart:io';

void main() {
  print("==================================");
  print("HI! Welcome to the calculator app");
  print("==================================");

  while (true) {
    print("\nSelect an operation:");
    print("1 - Addition");
    print("2 - Subtraction");
    print("3 - Multiplication");
    print("4 - Division");
    print("5 - Exit");
    print("Enter your choice:");

    int operation = int.parse(stdin.readLineSync()!);
    if (operation == 5) {
      print("\nThank you for using the calculator :)\n");
      break;
    } else if (operation < 1 || operation > 5) {
      print("\nInvalid choice. Please select a valid operation.");
      continue;
    }

    print("Please enter the first number: ");
    double firstNumber = double.parse(stdin.readLineSync()!);
    print("Please enter the second number: ");
    double secondNumber = double.parse(stdin.readLineSync()!);

    switch (operation) {
      case 1:
        print(
          "$firstNumber + $secondNumber = ${add(firstNumber, secondNumber)}",
        );
        break;

      case 2:
        print(
          "$firstNumber - $secondNumber = ${subtract(firstNumber, secondNumber)}",
        );
        break;

      case 3:
        print(
          "$firstNumber * $secondNumber = ${multiply(firstNumber, secondNumber)}",
        );
        break;

      case 4:
        if (secondNumber == 0) {
          print("Error: Division by zero is not allowed.");
        } else {
          print(
            "$firstNumber / $secondNumber = ${divide(firstNumber, secondNumber)}",
          );
        }
        break;
    }
  }
}

double add(double a, double b) => a + b;

double subtract(double a, double b) => a - b;

double multiply(double a, double b) => a * b;

double divide(double a, double b) => a / b;
