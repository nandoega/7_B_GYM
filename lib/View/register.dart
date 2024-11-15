import 'package:flutter/material.dart'; // Mengimpor paket Flutter untuk membuat elemen UI
import 'package:pbp/View/login.dart'; // Mengimpor halaman Login
import 'package:pbp/View/beforeLogin.dart'; // Mengimpor halaman BeforeLogin
import 'package:pbp/data/people.dart'; // Mengimpor data pengguna

class RegisterView extends StatefulWidget { // Membuat widget stateful untuk halaman registrasi
  const RegisterView({super.key}); // Menambahkan konstanta untuk key agar widget lebih optimal

  @override
  State<RegisterView> createState() => _RegisterViewState(); // Membuat state dari RegisterView
}

class _RegisterViewState extends State<RegisterView> { // State dari RegisterView untuk mengelola UI dan data
  final _formKey = GlobalKey<FormState>(); // Kunci unik untuk mengelola validasi form

  // Controllers untuk mengelola input teks
  TextEditingController nameController = TextEditingController(); // Controller untuk nama lengkap
  TextEditingController emailController = TextEditingController(); // Controller untuk email
  TextEditingController passwordController = TextEditingController(); // Controller untuk password
  TextEditingController dobController = TextEditingController(); // Controller untuk tanggal lahir
  TextEditingController addressController = TextEditingController(); // Controller untuk alamat

  @override
  Widget build(BuildContext context) { // Metode build untuk mendesain UI
    return Scaffold( // Struktur dasar halaman
      backgroundColor: const Color(0xFF282A41), // Warna latar belakang halaman
      body: SafeArea( // SafeArea memastikan elemen tidak tumpang tindih dengan status bar
        child: Form( // Form digunakan untuk mengelola input dan validasi
          key: _formKey, // Menghubungkan form dengan kunci validasi
          child: Padding( // Memberikan ruang di sekeliling elemen
            padding: const EdgeInsets.symmetric(horizontal: 32.0), // Padding horizontal
            child: Column( // Elemen disusun secara vertikal
              mainAxisAlignment: MainAxisAlignment.center, // Elemen disusun di tengah secara vertikal
              children: [
                const Text( // Teks judul halaman
                  'Atma Gym', // Konten teks
                  style: TextStyle(
                    fontSize: 20, // Ukuran font
                    fontWeight: FontWeight.bold, // Membuat teks tebal
                    color: Colors.white, // Warna teks putih
                  ),
                ),
                const SizedBox(height: 8), // Memberikan jarak vertikal
                const Text( // Teks sub-judul halaman
                  'Let\'s get started', // Konten teks
                  style: TextStyle(
                    fontSize: 40, // Ukuran font lebih besar
                    color: Colors.white70, // Warna teks putih dengan transparansi
                  ),
                ),
                const SizedBox(height: 40), // Memberikan jarak besar ke elemen berikutnya

                // Input Nama Lengkap
                TextFormField( // Input teks untuk nama lengkap
                  controller: nameController, // Menghubungkan input dengan controller
                  decoration: InputDecoration( // Desain input teks
                    hintText: 'Full Name', // Placeholder untuk input
                    fillColor: Colors.white, // Warna latar belakang input
                    filled: true, // Mengaktifkan warna latar belakang
                    border: OutlineInputBorder( // Desain border input
                      borderRadius: BorderRadius.circular(10), // Membuat sudut melengkung
                    ),
                  ),
                  validator: (value) { // Validasi input
                    if (value == null || value.isEmpty) { // Jika kosong
                      return 'Full Name cannot be empty'; // Pesan error
                    }
                    return null; // Jika valid
                  },
                ),
                const SizedBox(height: 16), // Memberikan jarak vertikal

                // Input Email
                TextFormField( // Input teks untuk email
                  controller: emailController, // Menghubungkan input dengan controller
                  decoration: InputDecoration( // Desain input teks
                    hintText: 'Email', // Placeholder untuk input
                    fillColor: Colors.white, // Warna latar belakang input
                    filled: true, // Mengaktifkan warna latar belakang
                    border: OutlineInputBorder( // Desain border input
                      borderRadius: BorderRadius.circular(10), // Membuat sudut melengkung
                    ),
                  ),
                  validator: (value) { // Validasi input
                    if (value == null || value.isEmpty) { // Jika kosong
                      return 'Email cannot be empty'; // Pesan error
                    }
                    if (!value.contains('@')) { // Jika format email salah
                      return 'Invalid email format'; // Pesan error
                    }
                    return null; // Jika valid
                  },
                ),
                const SizedBox(height: 16), // Memberikan jarak vertikal

                // Input Password
                TextFormField( // Input teks untuk password
                  controller: passwordController, // Menghubungkan input dengan controller
                  obscureText: true, // Menyembunyikan teks untuk keamanan
                  decoration: InputDecoration( // Desain input teks
                    hintText: 'Password', // Placeholder untuk input
                    fillColor: Colors.white, // Warna latar belakang input
                    filled: true, // Mengaktifkan warna latar belakang
                    border: OutlineInputBorder( // Desain border input
                      borderRadius: BorderRadius.circular(10), // Membuat sudut melengkung
                    ),
                  ),
                  validator: (value) { // Validasi input
                    if (value == null || value.isEmpty) { // Jika kosong
                      return 'Password cannot be empty'; // Pesan error
                    }
                    if (value.length < 8) { // Jika panjang password kurang dari 8 karakter
                      return 'Password must be at least 8 characters long'; // Pesan error
                    }
                    return null; // Jika valid
                  },
                ),
                const SizedBox(height: 16), // Memberikan jarak vertikal

                // Input Tanggal Lahir
                TextFormField( // Input teks untuk tanggal lahir
                  controller: dobController, // Menghubungkan input dengan controller
                  decoration: InputDecoration( // Desain input teks
                    hintText: 'Date of Birth', // Placeholder untuk input
                    fillColor: Colors.white, // Warna latar belakang input
                    filled: true, // Mengaktifkan warna latar belakang
                    border: OutlineInputBorder( // Desain border input
                      borderRadius: BorderRadius.circular(10), // Membuat sudut melengkung
                    ),
                  ),
                  validator: (value) { // Validasi input
                    if (value == null || value.isEmpty) { // Jika kosong
                      return 'Date of Birth cannot be empty'; // Pesan error
                    }
                    return null; // Jika valid
                  },
                ),
                const SizedBox(height: 16), // Memberikan jarak vertikal

                // Input Alamat
                TextFormField( // Input teks untuk alamat
                  controller: addressController, // Menghubungkan input dengan controller
                  decoration: InputDecoration( // Desain input teks
                    hintText: 'Address', // Placeholder untuk input
                    fillColor: Colors.white, // Warna latar belakang input
                    filled: true, // Mengaktifkan warna latar belakang
                    border: OutlineInputBorder( // Desain border input
                      borderRadius: BorderRadius.circular(10), // Membuat sudut melengkung
                    ),
                  ),
                  validator: (value) { // Validasi input
                    if (value == null || value.isEmpty) { // Jika kosong
                      return 'Address cannot be empty'; // Pesan error
                    }
                    return null; // Jika valid
                  },
                ),
                const SizedBox(height: 30), // Memberikan jarak besar ke elemen berikutnya

                // Tombol Register
                ElevatedButton( // Tombol dengan elevasi
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3951BD), // Warna tombol
                    padding: const EdgeInsets.symmetric(vertical: 15), // Padding tombol
                    minimumSize: const Size.fromHeight(50), // Tinggi minimum tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Membuat sudut melengkung
                    ),
                  ),
                  onPressed: () { // Fungsi yang dipanggil saat tombol ditekan
                    if (_formKey.currentState!.validate()) { // Memeriksa validasi form
                      users.add(User( // Menambahkan pengguna baru ke daftar
                        name: nameController.text, // Mengambil input nama
                        email: emailController.text, // Mengambil input email
                        password: passwordController.text, // Mengambil input password
                        dob: dobController.text, // Mengambil input tanggal lahir
                        address: addressController.text, // Mengambil input alamat
                      ));

                      showDialog( // Menampilkan dialog sukses
                        context: context, // Konteks untuk dialog
                        barrierDismissible: false, // Dialog tidak bisa ditutup dengan klik di luar
                        builder: (BuildContext context) {
                          return Dialog( // Membuat dialog
                            backgroundColor: Colors.transparent, // Warna latar belakang transparan
                            child: Stack( // Stack untuk menumpuk elemen
                              alignment: Alignment.center, // Elemen berada di tengah
                              children: [
                                Container( // Kontainer untuk isi dialog
                                  width: MediaQuery.of(context).size.width * 0.8, // Lebar dialog
                                  padding: const EdgeInsets.all(20), // Padding dalam dialog
                                  decoration: BoxDecoration( // Desain kontainer
                                    color: Colors.white, // Warna latar belakang putih
                                    borderRadius: BorderRadius.circular(12), // Sudut melengkung
                                  ),
                                  child: Column( // Kolom untuk isi dialog
                                    crossAxisAlignment: CrossAxisAlignment.start, // Elemen di kiri
                                    mainAxisSize: MainAxisSize.min, // Ukuran minimal
                                    children: [
                                      const Text( // Judul dialog
                                        'Register Successful!', // Konten teks
                                        style: TextStyle(
                                          fontSize: 18, // Ukuran font
                                          fontWeight: FontWeight.bold, // Membuat teks tebal
                                          color: Colors.black, // Warna teks hitam
                                        ),
                                      ),
                                      const SizedBox(height: 10), // Memberikan jarak vertikal
                                      const Text( // Subjudul dialog
                                        'Please continue to log in.', // Konten teks
                                        style: TextStyle(
                                          fontSize: 16, // Ukuran font
                                          color: Colors.black87, // Warna teks hitam dengan transparansi
                                        ),
                                        textAlign: TextAlign.left, // Teks rata kiri
                                      ),
                                      const SizedBox(height: 20), // Memberikan jarak vertikal
                                      Align( // Menempatkan tombol di kanan bawah
                                        alignment: Alignment.bottomRight, // Posisi tombol
                                        child: ElevatedButton( // Tombol dengan elevasi
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFFEAC009), // Warna tombol
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8, // Padding vertikal
                                              horizontal: 16, // Padding horizontal
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8), // Sudut melengkung
                                            ),
                                          ),
                                          onPressed: () { // Fungsi saat tombol ditekan
                                            Navigator.pushReplacement( // Berpindah halaman
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => const LoginView(), // Navigasi ke LoginView
                                              ),
                                            );
                                          },
                                          child: const Text( // Teks tombol
                                            'OK', // Konten teks
                                            style: TextStyle(
                                              fontSize: 14, // Ukuran font
                                              fontWeight: FontWeight.bold, // Membuat teks tebal
                                              color: Colors.black, // Warna teks hitam
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text('REGISTER', style: TextStyle(color: Colors.white)), // Teks tombol
                ),
                const SizedBox(height: 20), // Memberikan jarak vertikal

                // Divider "or"
                Row(
                  children: const [
                    Expanded(
                      child: Divider( // Garis pemisah
                        color: Colors.white70, // Warna garis
                        thickness: 1, // Ketebalan garis
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0), // Padding horizontal
                      child: Text(
                        'or', // Teks pemisah
                        style: TextStyle(color: Colors.white70), // Warna teks
                      ),
                    ),
                    Expanded(
                      child: Divider( // Garis pemisah
                        color: Colors.white70, // Warna garis
                        thickness: 1, // Ketebalan garis
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // SizedBox digunakan untuk memberikan jarak vertikal sebesar 20 pixel di antara elemen.

                // Sudah memiliki akun? Login
                Row( // Row digunakan untuk menampilkan elemen secara horizontal.
                  mainAxisAlignment: MainAxisAlignment.center, // Elemen dalam Row disejajarkan di tengah secara horizontal.
                  children: [ // Daftar anak-anak elemen dalam Row.
                    const Text( // Elemen teks statis.
                      "Already have an account? ", // Konten teks yang ditampilkan.
                      style: TextStyle(color: Colors.white70), // Warna teks diatur menjadi putih transparan.
                    ),
                    GestureDetector( // GestureDetector digunakan untuk menangkap interaksi pengguna seperti tap.
                      onTap: () { // Fungsi yang akan dipanggil saat teks diklik.
                        Navigator.push( // Navigator digunakan untuk menavigasi ke halaman lain.
                          context, // Konteks aplikasi saat ini.
                          MaterialPageRoute(builder: (_) => const LoginView()), // Membangun halaman LoginView.
                        );
                      },
                      child: const Text( // Teks yang dapat diklik.
                        'Login', // Konten teks.
                        style: TextStyle(
                          color: Colors.white, // Warna teks putih.
                          fontWeight: FontWeight.bold, // Teks dibuat tebal.
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40), // SizedBox untuk memberikan jarak vertikal sebesar 40 pixel sebelum elemen berikutnya.

                // "Wanna take a look?" link
                MouseRegion( // MouseRegion digunakan untuk menampilkan perubahan kursor saat pointer berada di area elemen.
                  cursor: SystemMouseCursors.click, // Kursor berubah menjadi tanda klik saat berada di area elemen.
                  child: GestureDetector( // GestureDetector untuk mendeteksi klik pengguna.
                    onTap: () { // Fungsi yang akan dipanggil saat elemen diklik.
                      Navigator.push( // Navigasi ke halaman lain.
                        context, // Konteks aplikasi saat ini.
                        MaterialPageRoute(builder: (_) => const BeforeLoginView()), // Membangun halaman BeforeLoginView.
                      );
                    },
                    child: const Text( // Elemen teks dengan gaya khusus.
                      'wanna take a look ?', // Konten teks.
                      style: TextStyle(
                        color: Colors.white, // Warna teks putih.
                        decoration: TextDecoration.underline, // Memberikan garis bawah pada teks.
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30), // SizedBox untuk memberikan jarak vertikal sebesar 30 pixel sebelum elemen berikutnya.

              ],
            ),
          ),
        ),
      ),
    );
  }
}
