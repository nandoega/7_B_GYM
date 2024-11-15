import 'package:flutter/material.dart';
import 'package:pbp/View/home.dart';
import 'package:pbp/View/register.dart';
import 'package:pbp/View/gym_facilities.dart'; // Import halaman fasilitas gym

class LoginView extends StatefulWidget {
  final Map? data;

  const LoginView({super.key, this.data});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Map? dataForm = widget.data;

    return Scaffold(
      backgroundColor: const Color(0xFF282A41), // Background color 282A41
      body: SafeArea(
        child: Center(
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
                    'Please, Log In',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Input Email
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
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Input Password
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
                  const SizedBox(height: 30),

                  // Login Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3951BD), // Button color 3951BD
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (dataForm!['username'] == emailController.text &&
                            dataForm['password'] == passwordController.text) {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeView()));
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Incorrect Password'),
                              content: TextButton(
                                onPressed: () => pushRegister(context),
                                child: const Text('Register Here!!'),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    child: const Text('LOGIN', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 20),

                  // "----------- or ----------" Divider
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          color: Colors.white70,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
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

                  // Register and "Wanna take a look?" links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account yet? ",
                        style: TextStyle(color: Colors.white70),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => pushRegister(context),
                          child: const Text(
                            'Register here',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const GymFacilitiesView()));
                      },
                      child: const Text(
                        'wanna take a look ?',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void pushRegister(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterView()));
}
