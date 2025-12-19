class UserModel {
  final String name;
  final String email;
  final String? image;
  final String? token;
  final String? visa;
  final String? address;

  UserModel({
    required this.name,
    required this.email,
    required this.image,
    required this.token,
    required this.address,
    required this.visa,
  });
}
