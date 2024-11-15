import 'package:flutter/material.dart';
import 'package:pbp/View/login.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for all the fields
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282A41), // Background color from login.dart
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Atma Gym',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Let\'s get started',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 40),

                // Full Name
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Full Name cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Email
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    if (!value.contains('@')) {
                      return 'Invalid email format';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Password
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Date of Birth
                TextFormField(
                  controller: dobController,
                  decoration: InputDecoration(
                    hintText: 'Date of Birth',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Date of Birth cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Address
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // Register Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3951BD), // Button color from login.dart
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registering...')),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginView()),
                      );
                    }
                  },
                  child: const Text('REGISTER', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 20),

                // Separator Line
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.white70,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'or',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white70,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.white70),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginView()),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'wanna take a look ?',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
