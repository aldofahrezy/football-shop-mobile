# Tugas 7: Elemen Dasar Flutter

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
