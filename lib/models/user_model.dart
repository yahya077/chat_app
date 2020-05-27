class UserModal {
  int id;
  String name;
  String email;
  String password;
  String imageUrl;

  UserModal({this.id, this.name, this.email,this.password , this.imageUrl});

  UserModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    imageUrl = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['picture'] = this.imageUrl;
    return data;
  }
}