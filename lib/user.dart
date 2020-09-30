class User {
  String FirstName;
  String LastName;
  String Email;
  String Mobile;
  String Password;

  User(this.FirstName, this.LastName, this.Email, this.Mobile, this.Password);

  User.map(dynamic obj) {
    this.FirstName = obj["FirstName"];
    this.LastName = obj["LastName"];
    this.Email = obj["Email"];
    this.Mobile = obj["Mobile"];
    this.Password = obj["Password"];
  }

  String get username => FirstName;

  String get lastname => LastName;

  String get email => Email;

  String get mobile => Mobile;

  String get password => Password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["FirstName"] = FirstName;
    map["LastName"] = LastName;
    map["Email"] = Email;
    map["Mobile"] = Mobile;
    map["Password"] = Password;

    return map;
  }
}
