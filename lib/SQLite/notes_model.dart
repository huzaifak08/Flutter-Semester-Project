class NotesModel {
  final int? id;
  final String name;

  NotesModel({this.id, required this.name});

  NotesModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
