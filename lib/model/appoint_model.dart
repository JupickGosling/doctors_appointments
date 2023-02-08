class AppointModel {
  String? user;
  String? doctor;
  String? status;
  String? time;
  String? date;

  AppointModel({
    this.user,
    this.doctor,
    this.status,
    this.time,
    this.date,
  });

  factory AppointModel.fromMap(map) {
    return AppointModel(
      user: map['user'],
      doctor: map['doctor'],
      status: map['status'],
      time: map['time'],
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'doctor': doctor,
      'status': status,
      'time': time,
      'date': date,
    };
  }
}
