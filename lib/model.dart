class Models {
  Models({
   this.name,
    this.password,
  });

  String name;
  String password;

  factory Models.fromJson(Map<String, dynamic> json) => Models(
    name: json["name"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "password": password,
  };
}
