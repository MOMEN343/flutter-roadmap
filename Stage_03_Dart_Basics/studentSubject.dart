void main() {
  Student student1 = Student(
    name: "Momen Kraizem",
    age: 23,
    studentId: "10200800",
    grade: "A",
    subjectsList: [
      Subject(subjectName: "Math", creditHours: 3, teacherName: "Mr. Wesam"),
      Subject(
        subjectName: "Science",
        creditHours: 4,
        teacherName: "Mr. Bassam",
      ),
    ],
  );
  student1.studentInfo();

  Subject subject1 = Subject(
    subjectName: "Math",
    creditHours: 3,
    teacherName: "Mr. Wesam",
  );
  subject1.subjectInfo();

}

class Student {
  String name;
  int age;
  String studentId;
  String grade;
  List<Subject> subjectsList;

  Student({
    required this.name,
    required this.age,
    required this.studentId,
    required this.grade,
    required this.subjectsList,
  });

  void studentInfo() {
    print(
      "=================================== Student Info ===================================",
    );
    print(
      "${"Student ID".padRight(15)}    ${"Name".padRight(15)}     ${"Age".padRight(10)}     ${"Grade".padRight(10)}    ${"Subjects".padRight(20)}",
    );
    print(
      "${studentId.padRight(15)}    ${name.padRight(15)}     ${age.toString().padRight(12)}     ${grade.padRight(6)}    ${subjectsList.map((subject) => subject.subjectName).join(", ")}",
    );
    print(
      "====================================================================================",
    );
  }
}

class Subject {
  String subjectName;
  int creditHours;
  String teacherName;

  Subject({
    required this.subjectName,
    required this.creditHours,
    required this.teacherName,
  });

  void subjectInfo() {
    print("$subjectName - $teacherName - $creditHours hours");
  }
}
