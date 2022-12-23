class NotesModel {
  final int? id;
  final String name;
  final String cnic;
  final String age;
  final String phone;
  final String email;

  NotesModel(
      {this.id,
      required this.name,
      required this.cnic,
      required this.age,
      required this.phone,
      required this.email});

  NotesModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        cnic = res['cnic'],
        age = res['age'],
        phone = res['phone'],
        email = res['email'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'cnic': cnic,
      'age': age,
      'phone': phone,
      'email': email,
    };
  }
}
