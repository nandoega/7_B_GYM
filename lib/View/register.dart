import 'package:flutter/material.dart';
import 'package:pbp/View/login.dart';
import 'package:pbp/component/form_component.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for all the fields
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController notelpController = TextEditingController();
  TextEditingController dobController = TextEditingController(); // Date of Birth
  TextEditingController addressController = TextEditingController(); // Address

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Name Input Field
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                  controller: nameController,
                  hintTxt: "Nama Lengkap",
                  helperTxt: "Contoh: Budi Santoso",
                  iconData: Icons.person,
                ),

                // Email Input Field
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!p0.contains('@')) {
                      return 'Email harus menggunakan @';
                    }
                    return null;
                  },
                  controller: emailController,
                  hintTxt: "Email",
                  helperTxt: "Contoh: ucup@gmail.com",
                  iconData: Icons.email,
                ),
                
                // Username Input Field
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    if (p0.toLowerCase() == 'anjing') {
                      return 'Tidak boleh menggunakan kata kasar';
                    }
                    return null;
                  },
                  controller: usernameController,
                  hintTxt: "Username",
                  helperTxt: "Contoh: ucup123",
                  iconData: Icons.person,
                ),

                // Password Input Field
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    if (p0.length < 5) {
                      return 'Password minimal 5 karakter';
                    }
                    return null;
                  },
                  controller: passwordController,
                  hintTxt: "Password",
                  helperTxt: "Minimal 5 karakter",
                  iconData: Icons.lock,
                  password: true,
                ),

                // Phone Number Input Field
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Nomor Telepon tidak boleh kosong';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(p0)) {
                      return 'Nomor Telepon tidak valid';
                    }
                    return null;
                  },
                  controller: notelpController,
                  hintTxt: "No Telp",
                  helperTxt: "Contoh: 081234567890",
                  iconData: Icons.phone_android,
                ),

                // Date of Birth Input Field
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Tanggal lahir tidak boleh kosong';
                    }
                    return null;
                  },
                  controller: dobController,
                  hintTxt: "Tanggal Lahir",
                  helperTxt: "Contoh: 01/01/2000",
                  iconData: Icons.calendar_today,
                ),

                // Address Input Field
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                  controller: addressController,
                  hintTxt: "Alamat",
                  helperTxt: "Contoh: Jl. Kenangan No. 1",
                  iconData: Icons.home,
                ),

                // Register Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      Map<String, dynamic> formData = {
                        'name': nameController.text,
                        'username': usernameController.text,
                        'email': emailController.text,
                        'password': passwordController.text,
                        'notelp': notelpController.text,
                        'dob': dobController.text,
                        'address': addressController.text,
                      };
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext buildContext) => LoginView(data: formData),
                        ),
                      );
                    }
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
