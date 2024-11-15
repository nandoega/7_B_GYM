class User {
  final String name;
  final String email;
  final String password;
  final String dob;
  final String address;

  const User({
    required this.name,
    required this.email,
    required this.password,
    required this.dob,
    required this.address,
  });
}

// List to store all registered users dynamically during runtime
final List<User> users = [];
