class UserModel {
  late String userId, email, name, pic;

  UserModel({this.userId="0", this.email="exemple@gmail.com", this.name="A4C", this.pic=''});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }
  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
