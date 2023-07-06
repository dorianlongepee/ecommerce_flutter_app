class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String image;
  final String username;
  final String address;
  final String city;
  final String postalCode;

  User({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.image = '',
    this.username = '',
    this.address = '',
    this.city = '',
    this.postalCode = '',
  });

  factory User.fromJson(dynamic json) {
    return User(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
      username: json['username'] as String,
      address: json['address']['address'] as String,
      city: json['address']['city'] as String,
      postalCode: json['address']['postalCode'] as String,
    );
  }

  static User userFromSnapshot(Map snapshot) {
    return User.fromJson(snapshot);
  }

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, image: $image, username: $username, address: $address, city: $city, postalCode: $postalCode)';
  }
}
