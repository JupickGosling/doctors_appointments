class UserModel {
  String? uid;
  String? firstname;
  String? lastname;
  String? age;
  String? email;

  UserModel({this.uid, this.firstname, this.lastname, this.age, this.email});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      age: map['age'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstname': firstname,
      'lastname': lastname,
      'age': age,
      'email': email,
    };
  }
}
