class UserModel {
  final String email;
  final String firsName;
  final String surname;
  final String phoneNumber;

  UserModel(
      {required this.email,
      required this.firsName,
      required this.surname,
      required this.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firsName: json['first_name'],
      surname: json['surname'],
      phoneNumber: json['phone_number'],
    );
  }
}

class LocationModel {
  final String street;
  final String region;
  final String buildNumber;
  final String apartmentNumber;

  LocationModel(
      {required this.street,
      required this.region,
      required this.buildNumber,
      required this.apartmentNumber});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      street: json['street'],
      region: json['region'],
      buildNumber: json['build_number'],
      apartmentNumber: json['apartment_number'],
    );
  }
}
