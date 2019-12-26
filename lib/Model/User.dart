class User {
  int id, age;
  String fName, sName, gender;
  var friendsList = new List();

  User(
      {this.id,
      this.fName,
      this.sName,
      this.age,
      this.gender,
      this.friendsList});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        fName: json['firstName'],
        sName: json['surname'],
        age: json['age'],
        gender: json['gender'],
        friendsList: json['friends']);
  }
}
