import 'dart:convert';

import 'package:flutter/foundation.dart';

class DoctorInfo {
  String name;
  String image;
  String hospitalName;
  String speciality;
  String about;
  String address;
  double rating;
  List<AvailableTime> availableTimes;
  DoctorInfo({
    required this.name,
    required this.image,
    required this.hospitalName,
    required this.speciality,
    required this.about,
    required this.address,
    required this.rating,
    required this.availableTimes,
  });

  DoctorInfo copyWith({
    String? name,
    String? image,
    String? hospitalName,
    String? speciality,
    String? about,
    String? address,
    double? rating,
    List<AvailableTime>? availableTimes,
  }) {
    return DoctorInfo(
      name: name ?? this.name,
      image: image ?? this.image,
      hospitalName: hospitalName ?? this.hospitalName,
      speciality: speciality ?? this.speciality,
      about: about ?? this.about,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      availableTimes: availableTimes ?? this.availableTimes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'hospitalName': hospitalName,
      'speciality': speciality,
      'about': about,
      'address': address,
      'rating': rating,
      'availableTimes': availableTimes.map((x) => x.toMap()).toList(),
    };
  }

  factory DoctorInfo.fromMap(Map<String, dynamic> map) {
    return DoctorInfo(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      hospitalName: map['hospitalName'] ?? '',
      speciality: map['speciality'] ?? '',
      about: map['about'] ?? '',
      address: map['address'] ?? '',
      rating: map['rating'] ?? 0.0,
      availableTimes: List<AvailableTime>.from(
          map['availableTimes']?.map((x) => AvailableTime.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorInfo.fromJson(String source) =>
      DoctorInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DoctorInfo(name: $name, image: $image, hospitalName: $hospitalName, speciality: $speciality, about: $about, address: $address, rating: $rating, availableTimes: $availableTimes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DoctorInfo &&
        other.name == name &&
        other.image == image &&
        other.hospitalName == hospitalName &&
        other.speciality == speciality &&
        other.about == about &&
        other.address == address &&
        other.rating == rating &&
        listEquals(other.availableTimes, availableTimes);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        hospitalName.hashCode ^
        speciality.hashCode ^
        about.hashCode ^
        address.hashCode ^
        rating.hashCode ^
        availableTimes.hashCode;
  }
}

class AvailableTime {
  String day;
  String time;
  AvailableTime({
    required this.day,
    required this.time,
  });

  AvailableTime copyWith({
    String? day,
    String? time,
  }) {
    return AvailableTime(
      day: day ?? this.day,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'time': time,
    };
  }

  factory AvailableTime.fromMap(Map<String, dynamic> map) {
    return AvailableTime(
      day: map['day'] ?? '',
      time: map['time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AvailableTime.fromJson(String source) =>
      AvailableTime.fromMap(json.decode(source));

  @override
  String toString() => 'AvailableTime(day: $day, time: $time)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AvailableTime && other.day == day && other.time == time;
  }

  @override
  int get hashCode => day.hashCode ^ time.hashCode;
}
