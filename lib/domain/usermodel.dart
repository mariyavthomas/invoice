class UserModel {
  String? organizationName;
  String? phone;
  String? password;
  String? uid;
  String? image;
  String ?email;

  // Constructor
  UserModel({
    this.organizationName,
    this.phone,
    this.password,
    this.uid,
    this.image,
    this.email,
  });

  // fromJson method
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email:json['email'] ?? "",
      organizationName: json['organizationName'] ?? "",
      phone: json['phone'] ??"",
      password: json['password'] ?? "",
      uid: json['uid'] ?? "",
      image: json['image'] ?? "",
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organizationName']=this.organizationName;
    data['email']=this.email;
    data['uid']=this.uid;
    data['image']=this.image;
    data['phone']=this.phone;
    data['password']=this.password;
    return data;
  }
}
