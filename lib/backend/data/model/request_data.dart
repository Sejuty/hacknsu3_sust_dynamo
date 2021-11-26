import 'dart:convert';

class ReqData {
  String name;
  String email;
  String gender;
  int age;
  String date;
  String time;
  String description;
  ReqData({
    required this.name,
    required this.email,
    required this.gender,
    required this.age,
    required this.date,
    required this.time,
    required this.description,
  });
  

  ReqData copyWith({
    String? name,
    String? email,
    String? gender,
    int? age,
    String? date,
    String? time,
    String? description,
  }) {
    return ReqData(
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      date: date ?? this.date,
      time: time ?? this.time,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'gender': gender,
      'age': age,
      'date': date,
      'time': time,
      'description': description,
    };
  }

  factory ReqData.fromMap(Map<String, dynamic> map) {
    return ReqData(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'] ?? '',
      age: map['age'] ?? 0,
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReqData.fromJson(String source) => ReqData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReqData(name: $name, email: $email, gender: $gender, age: $age, date: $date, time: $time, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ReqData &&
      other.name == name &&
      other.email == email &&
      other.gender == gender &&
      other.age == age &&
      other.date == date &&
      other.time == time &&
      other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      gender.hashCode ^
      age.hashCode ^
      date.hashCode ^
      time.hashCode ^
      description.hashCode;
  }
}
