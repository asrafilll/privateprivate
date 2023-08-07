class SingleUserModel {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  SingleUserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory SingleUserModel.fromJson(Map<String, dynamic> json) =>
      SingleUserModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
