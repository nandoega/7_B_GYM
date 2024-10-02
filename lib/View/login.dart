import 'package:flutter/material.dart';
// Sesuai dengan nama project Anda , awalnya akan error pada home,register,form_component.dart
import 'package:guidedlayout2_1970/View/home.dart';
import 'package:guidedlayout2_1970/View/register.dart';
import 'package:guidedlayout2_1970/component/form_component.dart';

class LoginView extends StatefulWidget {
  // Variable map data dibuat bersifat nullable, karena ketika aplikasi dijalankan belum memiliki nilai ketika registrasi berhasil dilakukan
  final Map? data;
  /* Agar Map data bisa bersifat nullable, pada constructor dibungkus dengan tanda tanya */
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
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              iconData: Icons.password),
              
              // Baris yang berisi tombol login dan tombol mengarah ke halaman register
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tombol login
                  ElevatedButton(
                    onPressed: () {
                      // Cek statenya sudah valid atau belum valid
                      if (_formKey.currentState!.validate()) {
                        // jika sudah valid, cek username dan password yang diinputkan pada form telah sesuai dengan data yang diinputkan dari halaman register atau belum
                        if (dataForm!['username'] == usernameController.text && dataForm['password'] == passwordController.text) {
                          // Jika sesuai navigasi ke halaman Home
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeView()));
                        } else {
                          // Jika belum tampilkan Alert dialog
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
                    child: const Text('Login'),
                  ),
                  // Tombol ke halaman register
                  TextButton(
                    onPressed: () {
                      Map<String, dynamic> formData = {};
                      formData['username'] = usernameController.text;
                      formData['password'] = passwordController.text;
                      pushRegister(context);
                    },
                    child: const Text('Belum punya akun ?'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void pushRegister(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterView()));
}
