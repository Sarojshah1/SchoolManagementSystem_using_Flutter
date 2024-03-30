class Assignment {
  final String? id;
  final String? subject;
  final String? title;
  final String? description;
  final DateTime? dueDate;
  final String? className;

  Assignment({
    this.id,
    this.subject,
    this.title,
    this.description,
    this.dueDate,
    this.className,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      id: json['id'] as String?,
      subject: json['subject'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate'] as String) : null,
      className: json['className'] as String?,
    );
  }

  @override
  String toString() {
    return 'Assignment{id: $id, subject: $subject, title: $title, description: $description, dueDate: $dueDate, className: $className}';
  }
}
