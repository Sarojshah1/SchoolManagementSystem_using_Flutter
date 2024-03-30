class StudentIdManager {
  static final StudentIdManager _instance = StudentIdManager._internal();

  factory StudentIdManager() {
    return _instance;
  }

  StudentIdManager._internal();

  String? _studentId;

  void setStudentId(String? studentId) {
    _studentId = studentId;
  }

  String? get studentId => _studentId;
}
