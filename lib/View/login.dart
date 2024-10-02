import 'package:flutter/material.dart';
import 'package:pbp/View/home.dart';
import 'package:pbp/View/register.dart';
import 'package:pbp/component/form_component.dart';
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
    // TextEditingController
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    // widget mengacu pada instance/objek LoginView
    Map? dataForm = widget.data;

    return Scaffold(
      backgroundColor: Colors.blue[50], // Background color yang lebih cerah
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent, // Warna teks
                  ),
                ),
                const SizedBox(height: 30),

                // Input Username
                inputForm((p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "username tidak boleh kosong";
                  }
                  return null;
                },
                controller: usernameController,
                hintTxt: "Username",
                helperTxt: "Inputkan User yang telah didaftar",
                iconData: Icons.person),

                const SizedBox(height: 20),

                // Password
                inputForm((p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "password kosong";
                  }
                  return null;
                },
                password: true,
                controller: passwordController,
                hintTxt: "Password",
                helperTxt: "Inputkan Password",
                iconData: Icons.lock),

                const SizedBox(height: 30),

                // Baris yang berisi tombol login dan tombol mengarah ke halaman register
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Tombol login
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // Warna tombol
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (dataForm!['username'] == usernameController.text && dataForm['password'] == passwordController.text) {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeView()));
                          } else {
                            showDialog(context: context, builder:(_) => AlertDialog(
                              title: const Text('Password Salah'),
                              content: TextButton(
                                onPressed: () => pushRegister(context),
                                child: const Text('Daftar Disini !!')),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel')),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK')),
                              ],
                            ));
                          }
                        }
                      },
                      child: const Text('Login', style: TextStyle(color: Colors.white)),
                    ),

                    // Tombol ke halaman register
                    TextButton(
                      onPressed: () {
                        pushRegister(context);
                      },
                      child: const Text('Belum punya akun ?', style: TextStyle(color: Colors.blueAccent)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // Floating button untuk ke halaman gym
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const GymFacilitiesView()));
        },
        child: const Icon(Icons.fitness_center), // Ikon gym
      ),
    );
  }
}

void pushRegister(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterView()));
}
