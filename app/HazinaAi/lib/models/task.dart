import 'dart:convert';

class Task {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final DateTime? reminderTime;

  final TaskPriority priority;
  final TaskStatus status;

  final bool isCompleted;
  final bool isImportant;

  final String category;

  final DateTime createdAt;
  final DateTime updatedAt;


  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.reminderTime,

    this.priority = TaskPriority.medium,
    this.status = TaskStatus.pending,

    this.isCompleted = false,
    this.isImportant = false,

    this.category = "General",

    required this.createdAt,
    required this.updatedAt,
  });


  // Empty Task

  factory Task.empty() {
    return Task(
      id: "",
      title: "",
      description: "",
      date: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }


  // Copy With

  Task copyWith({

    String? id,
    String? title,
    String? description,

    DateTime? date,
    DateTime? reminderTime,

    TaskPriority? priority,
    TaskStatus? status,

    bool? isCompleted,
    bool? isImportant,

    String? category,

    DateTime? createdAt,
    DateTime? updatedAt,

  }) {

    return Task(

      id: id ?? this.id,

      title: title ?? this.title,

      description:
          description ?? this.description,

      date:
          date ?? this.date,

      reminderTime:
          reminderTime ?? this.reminderTime,


      priority:
          priority ?? this.priority,

      status:
          status ?? this.status,


      isCompleted:
          isCompleted ?? this.isCompleted,


      isImportant:
          isImportant ?? this.isImportant,


      category:
          category ?? this.category,


      createdAt:
          createdAt ?? this.createdAt,


      updatedAt:
          updatedAt ?? this.updatedAt,
    );
  }



  // To Map

  Map<String, dynamic> toMap(){

    return {

      "id": id,

      "title": title,

      "description": description,


      "date":
          date.toIso8601String(),


      "reminderTime":
          reminderTime?.toIso8601String(),


      "priority":
          priority.name,


      "status":
          status.name,


      "isCompleted":
          isCompleted,


      "isImportant":
          isImportant,


      "category":
          category,


      "createdAt":
          createdAt.toIso8601String(),


      "updatedAt":
          updatedAt.toIso8601String(),

    };
  }



  // From Map

  factory Task.fromMap(
      Map<String,dynamic> map){

    return Task(

      id:
          map["id"] ?? "",


      title:
          map["title"] ?? "",


      description:
          map["description"] ?? "",


      date:
          DateTime.parse(
            map["date"],
          ),


      reminderTime:
          map["reminderTime"] != null
              ? DateTime.parse(
                  map["reminderTime"],
                )
              : null,


      priority:
          TaskPriority.values.firstWhere(
            (e)=>
                e.name ==
                map["priority"],
            orElse: () =>
                TaskPriority.medium,
          ),


      status:
          TaskStatus.values.firstWhere(
            (e)=>
                e.name ==
                map["status"],
            orElse: () =>
                TaskStatus.pending,
          ),


      isCompleted:
          map["isCompleted"] ?? false,


      isImportant:
          map["isImportant"] ?? false,


      category:
          map["category"] ?? "General",


      createdAt:
          DateTime.parse(
            map["createdAt"],
          ),


      updatedAt:
          DateTime.parse(
            map["updatedAt"],
          ),
    );
  }



  // JSON

  String toJson(){

    return jsonEncode(
      toMap(),
    );
  }


  factory Task.fromJson(String source){

    return Task.fromMap(
      jsonDecode(source),
    );
  }



  @override
  String toString(){

    return
    "Task(id:$id, title:$title)";
  }



  @override
  bool operator ==(
      Object other){

    return
    identical(this, other) ||

    other is Task &&

    id == other.id &&
    title == other.title &&
    date == other.date &&
    isCompleted == other.isCompleted;

  }



  @override
  int get hashCode {

    return Object.hash(
      id,
      title,
      date,
      isCompleted,
    );

  }

}



// ===============================
// PRIORITY
// ===============================

enum TaskPriority {

  low,

  medium,

  high,

  urgent,

}



// ===============================
// STATUS
// ===============================

enum TaskStatus {

  pending,

  inProgress,

  completed,

  cancelled,

}