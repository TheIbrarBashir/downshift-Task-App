enum TaskStatus { pending, inProgress, completed }

class Task {
  String? title;
  String? details;
  DateTime? timeStamp;
  TaskStatus status;

  Task(
      {this.title,
      this.details,
      this.timeStamp,
      this.status = TaskStatus.pending});

  @override
  String toString() {
    return 'Task{ title: $title, details: $details, timeStamp: $timeStamp, status: $status}';
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'details': details,
      'timeStamp': timeStamp,
      'status': status,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      details: map['details'] as String,
      timeStamp: map['timeStamp'] as DateTime,
      status: map['status'] as TaskStatus,
    );
  }
}
