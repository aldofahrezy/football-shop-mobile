# Tugas Individu 7: Elemen Dasar Flutter

## Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Widget tree adalah struktur hierarki yang terdiri dari widget-widget di Flutter. Setiap widget dapat memiliki satu atau lebih child widget, membentuk pohon struktur. Hubungan parent-child bekerja dengan cara parent widget mengatur layout dan perilaku child widget-nya. Parent widget bertanggung jawab atas positioning, sizing, dan rendering child-nya. Misalnya, Column widget adalah parent yang mengatur child-child-nya secara vertikal.

## Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

- MaterialApp: Widget root yang menyediakan tema dan navigasi untuk aplikasi Material Design.
- Scaffold: Struktur dasar layout dengan AppBar, body, dan floating action button.
- AppBar: Bar atas yang menampilkan judul aplikasi.
- Padding: Widget yang menambahkan padding di sekitar child-nya.
- Column: Widget yang mengatur child-child-nya secara vertikal.
- Row: Widget yang mengatur child-child-nya secara horizontal.
- Card: Widget kartu dengan elevasi untuk Material Design.
- Container: Widget kotak yang dapat memiliki padding, margin, dan dekorasi.
- Text: Widget untuk menampilkan teks.
- SizedBox: Widget untuk memberikan jarak tetap antar widget.
- Center: Widget yang memusatkan child-nya di tengah parent.
- GridView.count: Widget yang membuat grid dengan jumlah kolom tertentu.
- Material: Widget yang memberikan properti visual Material Design.
- InkWell: Widget yang membuat child-nya responsif terhadap sentuhan dengan efek ripple.
- Icon: Widget untuk menampilkan ikon.
- SnackBar: Widget untuk menampilkan pesan sementara di bagian bawah layar.
- ScaffoldMessenger: Widget untuk mengelola SnackBar.

## Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

MaterialApp adalah widget yang menyediakan konfigurasi dasar untuk aplikasi Material Design, termasuk tema, navigasi, dan lokalization. MatrialApp sering digunakan sebagai root karena menyediakan semua konfigurasi yang diperlukan untuk aplikasi Flutter yang mengikuti pedoman Material Design, seperti tema warna, font, dan routing.

## Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

StatelessWidget adalah widget yang tidak memiliki state internal, artinya tampilannya tidak berubah berdasarkan interaksi pengguna atau data eksternal. StatefulWidget memiliki state yang dapat berubah selama lifetime widget, memungkinkan UI untuk update secara dinamis. Kita memilih StatelessWidget ketika UI statis dan tidak perlu update, sedangkan StatefulWidget digunakan ketika ada interaksi yang mempengaruhi tampilan, seperti counter atau form input.

## Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext adalah objek yang menyediakan informasi tentang lokasi widget dalam widget tree. BuildContext penting karena digunakan untuk mengakses tema, media query, dan navigasi. Di metode build, BuildContext digunakan untuk mendapatkan informasi tentang ancestor widget dan untuk membangun widget dengan konteks yang tepat.

## Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload adalah fitur yang memungkinkan developer untuk melihat perubahan kode secara instan tanpa kehilangan state aplikasi. Hot reload hanya mengganti kode yang berubah dan mempertahankan state aplikasi. Sebaliknya, hot restart melakukan restart penuh aplikasi, menghilangkan semua state dan memuat ulang aplikasi dari awal. Hot reload lebih cepat dan berguna untuk perubahan UI, sedangkan hot restart diperlukan untuk perubahan struktural seperti main() atau initState().

<br>

# Tugas Individu 8: Flutter Navigation, Layouts, Forms, and Input Elements

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() menambahkan route baru ke stack navigasi, sehingga pengguna dapat kembali ke halaman sebelumnya dengan tombol back. Navigator.pushReplacement() menggantikan route saat ini dengan route baru, menghapus route sebelumnya dari stack. Sebenarnya, saya menggunakan Navigator.push() untuk navigasi ke halaman form dari halaman utama agar pengguna bisa kembali. Namun, fungsi ini tertutup oleh drawer (mengikuti apa yang telah diajarkan pada tutorial). Untuk drawer, saya menggunakan Navigator.pushReplacement() agar halaman baru menggantikan yang lama tanpa menumpuk stack.

## Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Scaffold menyediakan struktur dasar dengan AppBar dan body. AppBar menampilkan judul dan warna tema. Drawer ditambahkan ke Scaffold untuk navigasi konsisten. Ini memastikan setiap halaman memiliki layout seragam dengan header dan menu samping.

## Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Padding menambahkan ruang di sekitar elemen untuk menghindari crowding (membuatnya lebih enak dilihat juga). SingleChildScrollView membuat form scrollable jika konten melebihi layar. ListView bisa digunakan untuk daftar elemen. Tentunya tiga fitur ini meningkatkan kualitas pengalaman pengguna (UX) dari aplikasi kita. Implementasi padding saya sendiri digunakan di sekitar TextFormField untuk spacing, sedangkan SingleChildScrollView membungkus Column form agar bisa di-scroll jika panjang.

## Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Saya menggunakan ThemeData dengan ColorScheme.fromSeed(seedColor: Colors.deepPurple) di MaterialApp. AppBar menggunakan Theme.of(context).colorScheme.primary untuk konsistensi. Drawer header menggunakan warna deepPurple untuk brand football shop. Ini mungkin masih bisa berubah mengingat saya ingin menyelaraskannya dengan aplikasi web pra uts.

<br>

# Tugas Individu 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

## Mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Model Dart diperlukan untuk memetakan data JSON ke objek terstruktur, memungkinkan validasi tipe data, null-safety melalui fitur Dart seperti nullable types, dan meningkatkan maintainability dengan menyediakan struktur yang jelas dan mudah diubah. Jika langsung menggunakan Map<String, dynamic>, risiko kesalahan runtime tinggi karena tidak ada validasi tipe, null-safety tidak terjamin (berpotensi crash), dan kode sulit dipelihara karena perubahan struktur data memerlukan penyesuaian manual di banyak tempat.

## Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Package http menyediakan fungsi dasar untuk melakukan HTTP requests seperti GET, POST, dll., untuk komunikasi dengan server. CookieRequest adalah wrapper khusus yang mengelola cookies secara otomatis, penting untuk autentikasi berbasis session. Perbedaannya: http fokus pada request/response dasar tanpa state management, sedangkan CookieRequest mempertahankan session melalui cookies, memungkinkan autentikasi persisten tanpa perlu mengirim credentials berulang.

## Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instance CookieRequest perlu dibagikan agar semua komponen dapat mengakses session yang sama, memungkinkan autentikasi konsisten di seluruh aplikasi. Tanpa sharing, setiap komponen akan membuat instance baru, kehilangan session dan memaksa login berulang. Dengan Provider atau InheritedWidget, instance ini di-pass ke widget tree, memastikan state session global.

## Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Konfigurasi meliputi: menambahkan 10.0.2.2 (alamat emulator Android untuk localhost) ke ALLOWED_HOSTS Django agar menerima request dari emulator; mengaktifkan CORS untuk mengizinkan cross-origin requests dari Flutter; mengatur SameSite cookie untuk kompatibilitas browser; dan menambahkan izin internet di AndroidManifest.xml. Jika tidak benar, komunikasi gagal: request ditolak (CORS), host tidak diizinkan, atau aplikasi tidak bisa akses internet, menyebabkan error koneksi.

## Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Pengguna input data di form Flutter, data dikumpul dan dikirim via HTTP POST ke Django endpoint menggunakan CookieRequest. Django memproses, menyimpan ke database, dan mengembalikan response. Flutter menerima JSON response, parse ke model Dart, dan update UI untuk menampilkan data baru, sering dengan refresh list atau navigasi ke halaman detail.

## Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Untuk login: input username/password di Flutter, kirim POST ke Django login endpoint. Django verifikasi credentials, buat session dengan cookie jika valid. Flutter terima response sukses, simpan cookie via CookieRequest, navigasi ke menu utama. Register serupa tapi POST ke register endpoint, Django buat user baru. Logout: kirim request ke logout endpoint, Django hapus session, Flutter clear state dan kembali ke login screen.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

1. Buat model Dart untuk product entry dengan fields sesuai JSON dari Django, menggunakan factory constructor untuk parsing.
2. Tambahkan package http dan pbp_django_auth untuk CookieRequest di pubspec.yaml.
3. Buat Provider untuk CookieRequest instance di main.dart, wrap MaterialApp agar semua widget akses.
4. Konfigurasi Django: tambah 10.0.2.2 ke ALLOWED_HOSTS, install django-cors-headers, aktifkan CORS, atur SESSION_COOKIE_SAMESITE.
5. Di AndroidManifest.xml, tambah <uses-permission android:name="android.permission.INTERNET" />.
6. Implementasi form: gunakan TextFormField untuk input, validasi dengan FormState, kirim data via CookieRequest.post().
7. Untuk autentikasi: buat screen login/register dengan form, kirim credentials ke Django, handle response untuk navigasi.
8. Untuk logout: buat fungsi yang panggil logout endpoint dan clear navigation stack.
9. Test integrasi dengan emulator, pastikan data flow dari input ke display bekerja.

# The Kickoff Zone
[![Build Status](https://app.bitrise.io/app/49583e37-8dfb-4fc4-91fb-a1afba461daf/status.svg?token=rEjfK-UIqgPiuJsd7EmOGg&branch=main)](https://app.bitrise.io/app/49583e37-8dfb-4fc4-91fb-a1afba461daf)

## Download
https://app.bitrise.io/app/49583e37-8dfb-4fc4-91fb-a1afba461daf/installable-artifacts/506473a931cda6d6/public-install-page/c257232ad87699d7cf1e3dace578b25f
