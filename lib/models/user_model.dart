class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String ?phoneNumber;
  String ?id;

  UserModel({this.firstName, this.lastName, this.email, this.phoneNumber,
    this.id});
  UserModel.fromFirestore(Map<String, dynamic> data){
    firstName=data['firstName'];
    lastName=data['lastName'];
    email=data['email'];
    phoneNumber=data['phoneNumber'];
    id=data['id'];
  }
  Map<String, dynamic> toFirestore() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'id': id,
    };
  }
}

