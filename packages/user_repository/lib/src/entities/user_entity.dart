class MyUserEntity {
  final String userId;
  final String name;
  final String email;
  final int age;
  final String description;
  final Map<String, double> location;
  final List<String> pictures;

  const MyUserEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.age,
    required this.description,
    required this.location,
    required this.pictures,
  });

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'age': age,
      'description': description,
      'location': location,
      'pictures': pictures,
    };
  }

  static MyUserEntity fromDocument(Map<String, Object?> doc) {
    return MyUserEntity(
      userId: doc['userId'] as String,
      name: doc['name'] as String,
      email: doc['email'] as String,
      age: doc['age'] as int,
      description: doc['description'] as String,
      location: doc['location'] as Map<String, double>,
      pictures: doc['pictures'] as List<String>,
    );
  }
}
