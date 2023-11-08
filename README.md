# Tugas 7: Elemen Dasar Flutter
### Ramadhan Andika Putra (2206081976) - PBP A <br>


#### Jelaskan bagaimana cara kamu mengimplementasikan *checklist* di atas secara *step-by-step*!
>> #### [ Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya. ]
>> Langkah pertama yang dilakukan adalah membuka Terminal atau Command Prompt. Lalu, masuk ke direktori di mana saya ingin menyimpan proyek Flutter untuk tugas kali ini. Setelah itu, saya me-*generate* proyek Flutter baru dengan nama "pachill_market" dan masuk ke dalam direktori proyek tersebut. Setelah itu, saya menjalankan proyek melalui Terminal atau Command Prompt.
>>
>> Setelah proyek Flutter berhasil dijalankan dan terlihat bekerja dengan baik, lakukan inisialisasi Git pada root folder proyek. Lalu, saya menambahkan, commit, dan push proyek ke repositori baru di GitHub dengan nama "pachill-market-mobile"
>>
>> Selanjutnya, untuk merapikan struktur proyek, saya membuat file baru bernama "menu.dart" pada direktori "pachill_market/lib". Pada baris pertama file tersebut, saya menambahkan kode berikut ini:<br>
>> <img width="226" alt="image" src="https://github.com/adhan-857/pachill-market-mobile/assets/119088782/9bb2a020-8373-4b3c-a744-f6c237ce2c9c"><br>
>>
>> Dari file "main.dart", saya memindahkan (cut) kode dari baris ke-39 hingga akhir yang berisi class MyHomePage dan class MyHomePageState ke dalam file "menu.dart" yang baru saja saya buat. Karena pemindahan ini, pada file "main.dart", akan terjadi error pada baris ke-34. Untuk menyelesaikan masalah ini, saya menambahkan kode berikut ini pada awal file "main.dart" untuk mengimpor "menu.dart":<br>
>> <img width="245" alt="image" src="https://github.com/adhan-857/pachill-market-mobile/assets/119088782/25c0d2a0-cb4e-4511-9781-72f2ab7d584a"><br>
>>
>> Jalankan proyek melalui Terminal atau Command Prompt lagi untuk memastikan bahwa aplikasi tetap dapat berjalan dengan baik setelah merapikan struktur proyek.
<br>

>> #### [ Membuat tiga tombol sederhana dengan ikon dan teks + Memunculkan `Snackbar` dengan tulisan]
>> Modifikasi File main.dart dengan cara mengubah tema aplikasi dengan mengatur `colorScheme` menjadi `ColorScheme.fromSeed(seedColor: Colors.indigo)`. Setelah mengubah warna tema aplikasi, saya mengubah sifat widget halaman menu menjadi *stateless* dengan cara menghapus `MyHomePage(title: 'Flutter Demo Home Page')` di `main.dart`. Di `menu.dart`, ubah widget halaman dari *stateful* menjadi *stateless* dengan memodifikasi kode.
>>
>> Setelah mengubah sifat widget halaman menu menjadi stateless, saya menambahkan teks dan card untuk memperlihatkan barang yang dijual. Pertama, kita *define* tipe pada list:<br>
>> <img width="203" alt="image" src="https://github.com/adhan-857/pachill-market-mobile/assets/119088782/940145b7-a683-4a6b-a5d5-8893280f009b"><br>
>>
>> lalu, saya menambahkan barang-barang yang dijual (nama, harga, dan icon barang tersebut):<br>
>> <img width="324" alt="image" src="https://github.com/adhan-857/pachill-market-mobile/assets/119088782/1c9c77f0-a055-4402-9e9c-92f9b62989c1"><br>
>>
>> Selanjutnya, tambahkan kode dibawah ini di dalam Widget build:<br>
>> ````
>>       return Scaffold(
>>        appBar: AppBar(
>>          backgroundColor: const Color.fromARGB(255, 0, 94, 255),
>>          title: RichText(
>>            text: TextSpan(
>>              children: [
>>                TextSpan(
>>                  text: 'Pachill',
>>                  style: TextStyle(
>>                    fontFamily: 'UniSans',
>>                    color: Colors.white,
>>                    fontSize: 25,
>>                  ),
>>                ),
>>                TextSpan(
>>                  text: '.market',
>>                  style: TextStyle(
>>                    fontFamily: 'UniSans',
>>                    color: Colors.yellow,
>>                    fontSize: 25,
>>                  ),
>>                ),
>>              ],
>>            ),
>>          ),
>>        ),
>>            body: SingleChildScrollView(
>>              // Widget wrapper yang dapat discroll
>>              child: Padding(
>>                padding: const EdgeInsets.all(10.0), // Set padding dari halaman
>>                child: Column(
>>                  // Widget untuk menampilkan children secara vertikal
>>                  children: <Widget>[
>>                    const Padding(
>>                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
>>                      // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
>>                      child: Text(
>>                        'Pengelola Supermarket Idaman Kamu :D', // Text yang menandakan toko
>>                        textAlign: TextAlign.center,
>>                        style: TextStyle(
>>                          fontSize: 20,
>>                          fontWeight: FontWeight.bold,
>>                        ),
>>                      ),
>>                    ),
>>                    // Grid layout
>>                    GridView.count(
>>                      // Container pada card kita.
>>                      primary: true,
>>                      padding: const EdgeInsets.all(20),
>>                      crossAxisSpacing: 10,
>>                      mainAxisSpacing: 10,
>>                      crossAxisCount: 3,
>>                      shrinkWrap: true,
>>                      children: items.map((ShopItem item) {
>>                        // Iterasi untuk setiap item
>>                        return ShopCard(item);
>>                      }).toList(),
>>                    ),
>>                  ],
>>                ),
>>              ),
>>            ),
>>          );
>> ````
>>
>> Teakhir, buat widget stateless baru untuk menampilkan card:<br>
>> ````
>> class ShopCard extends StatelessWidget {
>>  final ShopItem item;
>>  const ShopCard(this.item, {super.key}); // Constructor
>>
>>  @override
>>  Widget build(BuildContext context) {
>>    Color backgroundColor;
>>    switch (item.name) {
>>      case "Tambah Produk":
>>        backgroundColor = Colors.green;
>>        break;
>>      case "Logout":
>>        backgroundColor = Colors.red;
>>        break;
>>      default:
>>        backgroundColor = Colors.indigo;
>>    }
>>
>>    return Material(
>>      color: backgroundColor, // Apply the determined color
>>      child: InkWell(
>>        // Area responsive terhadap sentuhan
>>        onTap: () {
>>          // Memunculkan SnackBar ketika diklik
>>          ScaffoldMessenger.of(context)
>>            ..hideCurrentSnackBar()
>>            ..showSnackBar(SnackBar(
>>                content: Text("Kamu telah menekan tombol ${item.name}!")));
>>        },
>>        child: Container(
>>          // Container untuk menyimpan Icon dan Text
>>          padding: const EdgeInsets.all(8),
>>          child: Center(
>>            child: Column(
>>              mainAxisAlignment: MainAxisAlignment.center,
>>              children: [
>>                Icon(
>>                  item.icon,
>>                  color: Colors.white,
>>                  size: 30.0,
>>                ),
>>                const Padding(padding: EdgeInsets.all(3)),
>>                Text(
>>                  item.name,
>>                  textAlign: TextAlign.center,
>>                  style: const TextStyle(color: Colors.white),
>>                ),
>>              ],
>>            ),
>>          ),
>>        ),
>>      ),
>>    );
>>  }
>>}
>> ````
<br>
<br>

#### Apa perbedaan utama antara *stateless* dan *stateful widget* dalam konteks pengembangan aplikasi Flutter?
Perbedaan utama antara *stateless* dan *stateful widget* dalam konteks pengembangan aplikasi Flutter adalah kemampuannya untuk berubah. *Stateless widget* tidak dapat berubah setelah dibuat, sedangkan *stateful widget* dapat berubah.<br>
<br>
*Stateless widget* cocok untuk menggambarkan bagian dari antarmuka pengguna yang tidak bergantung pada apa pun selain informasi konfigurasi dan *BuildContext*. Misalnya, *widget* teks, ikon, dan tombol naik. *Widget* ini akan dirender hanya sekali dan tidak akan memperbarui diri, tetapi hanya akan diperbarui ketika data eksternal berubah.<br>
<br>
*Stateful widget* cocok untuk menggambarkan bagian dari antarmuka pengguna yang dapat berubah secara dinamis. Misalnya, *widget* yang menampilkan jumlah item dalam daftar, atau *widget* yang merespons interaksi pengguna, seperti tombol atau input teks. *Widget* ini akan di-*render* ulang setiap kali keadaannya berubah.<br>
<br>
Di bawah ini adalah rangkuman perbedaan keduanya:
| Fitur            |     Stateless Widget          |      Statefull Widget         |
| ---------------- | ----------------------------- | ----------------------------- |
| Kemampuan berubah | Tidak dapat berubah     | Dapat berubah                                |
| Contoh            | Teks, ikon, tombol naik | Jumlah item dalam daftar, tombol, input teks |
| Penggunaan        | Bagian dari antarmuka pengguna yang tidak bergantung pada data eksternal atau interaksi pengguna | Bagian dari antarmuka pengguna yang dapat berubah secara dinamis |
<br>
<br>

#### Sebutkan seluruh *widget* yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing!
`MyHomePage` *(`StatelessWidget`)*:
* Merupakan widget utama yang merupakan kelas utama dalam aplikasi.
* Mewarisi `StatelessWidget`, yang berarti tidak memiliki keadaan *(state)* yang dapat berubah selama waktu proses.
<br>

`Scaffold`:
* Merupakan kerangka dasar aplikasi yang menyediakan tampilan dasar seperti *AppBar*, *body*, dan lainnya.
* Digunakan untuk mengelola tampilan utama aplikasi.
<br>

`AppBar`:
* Widget ini digunakan untuk menampilkan bilah atas pada tampilan aplikasi.
* Di dalamnya terdapat judul aplikasi dengan gaya teks yang ditentukan.
<br>

`RichText`:
* Widget ini digunakan untuk menampilkan teks dengan format yang berbeda dalam satu elemen.
* Dalam kode ini, digunakan untuk menggabungkan dua teks dengan gaya yang berbeda.
<br>

`SingleChildScrollView`:
* Merupakan widget yang digunakan untuk membuat area yang dapat discroll jika kontennya lebih besar dari layar.
* Digunakan untuk mengelilingi seluruh tampilan dalam satu widget.
<br>

`Padding`:
* Widget ini digunakan untuk menambahkan *padding* (jeda) di sekitar widget anaknya.
* Digunakan untuk mengatur jarak antara elemen-elemen dalam tampilan.
<br>

`Column`:
* Widget ini digunakan untuk menampilkan anak-anak *(children)* secara vertikal.
* Digunakan untuk mengelompokkan elemen-elemen dalam satu kolom.
<br>

`Text`:
* Digunakan untuk menampilkan teks dengan berbagai properti seperti ukuran, tebal, dan warna.
<br>

`GridView.count`:
* Merupakan widget yang digunakan untuk membuat grid dengan jumlah kolom yang tetap.
* Digunakan untuk menampilkan `ShopCard` untuk setiap elemen dalam `items`.
<br>

`ShopItem`:
* Merupakan kelas model yang digunakan untuk mewakili item toko dengan properti nama dan ikon.
* Merepresentasikan item-item dalam daftar toko.
<br>

`ShopCard`:
* Merupakan widget yang digunakan untuk menampilkan item toko dalam bentuk kartu.
* Menerima objek `ShopItem` sebagai argumen dan menampilkan ikon dan teks dengan latar belakang warna yang sesuai.
<br>

`Material`:
* Merupakan widget yang digunakan untuk memberikan efek elevasi pada widget-childnya.
* Dalam kode ini, digunakan untuk memberikan warna latar belakang pada ShopCard.
<br>

`InkWell`:
* Merupakan widget yang digunakan untuk membuat area yang responsif terhadap sentuhan.
* Digunakan untuk menambahkan interaksi ketika ShopCard diklik.
<br>

`SnackBar`:
* Merupakan pesan pop-up yang ditampilkan di bagian bawah layar saat ShopCard diklik.
* Menginformasikan pengguna bahwa tombol telah ditekan.
<br>
<br>
