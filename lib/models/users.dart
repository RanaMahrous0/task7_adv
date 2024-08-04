class Users {
  final int id;
  final String name;
  final String email;
  final String position;
  const Users(
      {required this.email,
      required this.name,
      required this.id,
      required this.position});

  factory Users.fromJson(Map<String, dynamic> data) {
    return Users(
        email: data['email'],
        name: data['name'],
        id: data['id'],
        position: data['position']);
  }
}
