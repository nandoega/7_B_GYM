class User {
  String name;
  String email;
  String password;
  String dob; // Date of birth
  String address;
  String profileImage;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.dob,
    required this.address,
    this.profileImage = '',
  });
}

List<User> users = [
  User(
    name: 'Aiko Evelyn',
    email: 'aikoevelyn@gmail.com',
    password: 'password123',
    dob: '1990-01-01',
    address: '123 Main St',
    profileImage: 'https://example.com/profile.jpg',
  ),
  // Add more users as needed
];
