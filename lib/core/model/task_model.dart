
class TaskModel {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? start;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;
  TaskModel({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.start,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
  });

  Map<String, dynamic> tojson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'note': note,
      'isCompleted': isCompleted,
      'date': date,
      'start': start,
      'endTime': endTime,
      'color': color,
      'remind': remind,
      'repeat': repeat,
    };
  }

  factory TaskModel.fromjson(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      note: map['note'] != null ? map['note'] as String : null,
      isCompleted: map['isCompleted'],
      date: map['date'] != null ? map['date'] as String : null,
      start: map['start'] != null ? map['start'] as String : null,
      endTime: map['endTime'] != null ? map['endTime'] as String : null,
      color: map['color'] != null ? map['color'] as int : null,
      remind: map['remind'] != null ? map['remind'] as int : null,
      repeat: map['repeat'] != null ? map['repeat'] as String : null,
    );
  }

  
}
