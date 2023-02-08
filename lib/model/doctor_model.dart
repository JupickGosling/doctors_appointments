class DoctorModel {
  String? uid;
  String? firstname;
  String? surname;
  String? patronymic;
  String? photo;
  String? rating;
  String? specialist;
  String? exp;
  String? patients;

  DoctorModel(
      {this.uid,
      this.firstname,
      this.surname,
      this.patronymic,
      this.photo,
      this.rating,
      this.exp,
      this.specialist,
      this.patients});

  factory DoctorModel.fromMap(map) {
    return DoctorModel(
      uid: map['uid'],
      firstname: map['Firstname'],
      surname: map['Surname'],
      patronymic: map['Patronymic'],
      photo: map['Photo'],
      rating: map['Rating'],
      exp: map['Exp'],
      specialist: map['Specialist'],
      patients: map['Patients'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'Firstname': firstname,
      'Surname': surname,
      'Patronymic': patronymic,
      'Photo': photo,
      'Rating': rating,
      'Exp': exp,
      'Specialist': specialist,
      'Patients': patients,
    };
  }
}
