class LoginModel {
  final String accessToken;
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String image;

  LoginModel({
    required this.accessToken,
    required this.id,
    required this.username,
    required this.email,
    required this.gender,
    required this.image,
    required this.firstName,
    required this.lastName,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      accessToken: json["accessToken"],
      id: json["id"],
      username: json["username"],
      email: json["email"],
      gender: json["gender"],
      image: json["image"],
      firstName: json["firstName"],
      lastName: json["lastName"],
    );
  }
}
