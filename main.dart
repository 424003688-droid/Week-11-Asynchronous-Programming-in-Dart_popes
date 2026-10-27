abstract class Evaluatable {
  String evaluatePerformance();
}

mixin Extracurriculars {
  final List<String> _activities = [];

  void addActivity(String activity) {
    _activities.add(activity);
  }

  void printActivities() {
    if (_activities.isNotEmpty) {
      print('   Activities: ${_activities.join(", ")}');
    } else {
      print('   Activities: None');
    }
  }
}

class Student implements Evaluatable {
  String name;
  String studentId;
  final List<double> _grades = [];

  Student(this.name, this.studentId);

  List<double> get grades => _grades;

  void addGrade(double grade) {
    if (grade >= 0 && grade <= 100) {
      _grades.add(grade);
    }
  }

  double getAverage() {
    if (_grades.isEmpty) return 0.0;
    double sum = _grades.reduce((a, b) => a + b);
    return sum / _grades.length;
  }

  void printRecord() {
    print('Student: $name | ID: $studentId | Average: ${getAverage().toStringAsFixed(2)}');
  }

  @override
  String evaluatePerformance() {
    return "Pending";
  }

  Future<String> saveRecordToCloud() async {
    await Future.delayed(Duration(seconds: 2));
    return "SUCCESS: Record for $name ($studentId) securely saved to the cloud.";
  }
}

class UndergraduateStudent extends Student with Extracurriculars {
  UndergraduateStudent(String name, String studentId) : super(name, studentId);

  @override
  String evaluatePerformance() {
    return getAverage() >= 75.0 ? "Pass" : "Fail";
  }

  @override
  void printRecord() {
    print('[Undergrad] $name | ID: $studentId | Average: ${getAverage().toStringAsFixed(2)} | Status: ${evaluatePerformance()}');
    printActivities();
  }
}

class GraduateStudent extends Student {
  String thesisTopic;

  GraduateStudent(String name, String studentId, this.thesisTopic) : super(name, studentId);

  @override
  String evaluatePerformance() {
    return getAverage() >= 85.0 ? "Pass" : "Fail";
  }

  @override
  void printRecord() {
    print('[Grad] $name | ID: $studentId | Average: ${getAverage().toStringAsFixed(2)} | Thesis: "$thesisTopic" | Status: ${evaluatePerformance()}');
  }
}

void main() async {
  UndergraduateStudent student1 = UndergraduateStudent('Alice Santos', 'NTC-2026-001');
  GraduateStudent student2 = GraduateStudent('Bob Reyes', 'NTC-2026-002', 'AI in Education');

  List<Student> enrolledStudents = [student1, student2];

  student1.addGrade(88.5);
  student1.addGrade(92.0);
  student1.addGrade(85.0);
  student1.addActivity('Debate Club');
  student1.addActivity('Student Council');

  student2.addGrade(78.0);
  student2.addGrade(82.5);
  student2.addGrade(90.0);
  
  for (var student in enrolledStudents) {
    student.printRecord();
    print('---');
  }

  print('\n--- Week 11 Async Demonstration ---');
  print('Initiating cloud backup for ${student1.name}. Please wait...');
  
  String result = await student1.saveRecordToCloud();
  
  print(result); 
  print('Cloud backup process finished.');
}
