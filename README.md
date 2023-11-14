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



# Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements
### Ramadhan Andika Putra (2206081976) - PBP A <br>


#### Jelaskan bagaimana cara kamu mengimplementasikan *checklist* di atas secara *step-by-step*!
>> #### [ Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru. ] +<br>[ Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru. ]
>> Pertama, saya membuat berkas baru pada direktori `lib` dengan nama `shoplist_form.dart`. Lalu, saya membuat beberapa variabel untuk menyimpan input dari masing-masing field yang akan dibuat untuk mengisi widget `Form` sesuai ketentuan yang diminta.<br>
>> <img width="266" alt="image" src="https://github.com/adhan-857/pachill-market-mobile/assets/119088782/aef59df0-f6b4-453c-a5a0-ab08504a757e"><br>
>>
>> Lalu, untuk form dan tombol 'Save' saya menambahkan validator terlebih dahulu agar setiap elemen input pada form tidak boleh kosong serta setiap elemen input harus berisi data dengan tipe data atribut modelnya menggunakan fungsi `showDialog()` untuk memunculkan widget `alertDialog`. Jika data yang dimasukkan sudah memenuhi validasi, maka data produk akan ditambahkan dalam `productList` saat tombol 'Save' ditekan serta form akan di-reset. Selain itu, akan muncul pop-up yang berisi informasi mengenai produk yang baru saja ditambahkan.<br>
>> ```
>>             children: [
>>               Padding(
>>                 padding: const EdgeInsets.all(8.0),
>>                 child: TextFormField(
>>                   decoration: InputDecoration(
>>                     hintText: "Nama Produk",
>>                     labelText: "Nama Produk",
>>                     border: OutlineInputBorder(
>>                       borderRadius: BorderRadius.circular(5.0),
>>                     ),
>>                   ),
>>                   onChanged: (String? value) {
>>                     setState(() {
>>                       _name = value!;
>>                     });
>>                   },
>>                   validator: (String? value) {
>>                     if (value == null || value.isEmpty) {
>>                       setState(() {
>>                         _nameError = "Nama tidak boleh kosong!";
>>                       });
>>                       return "Nama tidak boleh kosong!";
>>                     }
>>                     setState(() {
>>                       _nameError = "";
>>                     });
>>                     return null;
>>                   },
>>                 ),
>>               ),
>>               if (_nameError.isNotEmpty)
>>                 Padding(
>>                   padding: const EdgeInsets.all(8.0),
>>                   child: Text(
>>                     _nameError,
>>                     style: TextStyle(color: Colors.red),
>>                   ),
>>                 ),
>>               Padding(
>>                 padding: const EdgeInsets.all(8.0),
>>                 child: TextFormField(
>>                   decoration: InputDecoration(
>>                     hintText: "Harga",
>>                     labelText: "Harga",
>>                     border: OutlineInputBorder(
>>                       borderRadius: BorderRadius.circular(5.0),
>>                     ),
>>                   ),
>>                   onChanged: (String? value) {
>>                     setState(() {
>>                       _price = int.parse(value!);
>>                     });
>>                   },
>>                   validator: (String? value) {
>>                     if (value == null || value.isEmpty) {
>>                       setState(() {
>>                         _priceError = "Harga tidak boleh kosong!";
>>                       });
>>                       return "Harga tidak boleh kosong!";
>>                     }
>>                     if (int.tryParse(value) == null) {
>>                       setState(() {
>>                         _priceError = "Harga harus berupa angka!";
>>                       });
>>                       return "Harga harus berupa angka!";
>>                     }
>>                     setState(() {
>>                       _priceError = "";
>>                     });
>>                     return null;
>>                   },
>>                 ),
>>               ),
>>               if (_priceError.isNotEmpty)
>>                 Padding(
>>                   padding: const EdgeInsets.all(8.0),
>>                   child: Text(
>>                     _priceError,
>>                     style: TextStyle(color: Colors.red),
>>                   ),
>>                 ),
>>               Padding(
>>                 padding: const EdgeInsets.all(8.0),
>>                 child: TextFormField(
>>                   decoration: InputDecoration(
>>                     hintText: "Jumlah",
>>                     labelText: "Jumlah",
>>                     border: OutlineInputBorder(
>>                       borderRadius: BorderRadius.circular(5.0),
>>                     ),
>>                   ),
>>                   onChanged: (String? value) {
>>                     setState(() {
>>                       _amount = int.parse(value!);
>>                     });
>>                   },
>>                   validator: (String? value) {
>>                     if (value == null || value.isEmpty) {
>>                       setState(() {
>>                         _amountError = "Jumlah tidak boleh kosong!";
>>                       });
>>                       return "Jumlah tidak boleh kosong!";
>>                     }
>>                     if (int.tryParse(value) == null) {
>>                       setState(() {
>>                         _amountError = "Jumlah harus berupa angka!";
>>                       });
>>                       return "Jumlah harus berupa angka!";
>>                     }
>>                     setState(() {
>>                       _amountError = "";
>>                     });
>>                     return null;
>>                   },
>>                 ),
>>               ),
>>               if (_amountError.isNotEmpty)
>>                 Padding(
>>                   padding: const EdgeInsets.all(8.0),
>>                   child: Text(
>>                     _amountError,
>>                     style: TextStyle(color: Colors.red),
>>                   ),
>>                 ),
>>               Padding(
>>                 padding: const EdgeInsets.all(8.0),
>>                 child: TextFormField(
>>                   decoration: InputDecoration(
>>                     hintText: "Deskripsi",
>>                     labelText: "Deskripsi",
>>                     border: OutlineInputBorder(
>>                       borderRadius: BorderRadius.circular(5.0),
>>                     ),
>>                   ),
>>                   onChanged: (String? value) {
>>                     setState(() {
>>                       _description = value!;
>>                     });
>>                   },
>>                   validator: (String? value) {
>>                     if (value == null || value.isEmpty) {
>>                       setState(() {
>>                         _descriptionError = "Deskripsi tidak boleh kosong!";
>>                       });
>>                       return "Deskripsi tidak boleh kosong!";
>>                     }
>>                     setState(() {
>>                       _descriptionError = "";
>>                     });
>>                     return null;
>>                   },
>>                 ),
>>               ),
>>               if (_descriptionError.isNotEmpty)
>>                 Padding(
>>                   padding: const EdgeInsets.all(8.0),
>>                   child: Text(
>>                     _descriptionError,
>>                     style: TextStyle(color: Colors.red),
>>                   ),
>>                 ),
>>               Align(
>>                 alignment: Alignment.bottomCenter,
>>                 child: Padding(
>>                   padding: const EdgeInsets.all(8.0),
>>                   child: ElevatedButton(
>>                     style: ButtonStyle(
>>                       backgroundColor: MaterialStateProperty.all(
>>                           Color.fromARGB(255, 0, 94, 255)),
>>                     ),
>>                     onPressed: () {
>>                       if (_formKey.currentState!.validate()) {
>>                         productList.add({
>>                           'name': _name,
>>                           'price': _price,
>>                           'amount': _amount,
>>                           'description': _description,
>>                         });
>>                         
>>                         showDialog(
>>                           context: context,
>>                           builder: (context) {
>>                             return AlertDialog(
>>                               title: const Text('Produk berhasil tersimpan'),
>>                               content: SingleChildScrollView(
>>                                 child: Column(
>>                                   crossAxisAlignment: CrossAxisAlignment.start,
>>                                   children: [
>>                                     Text('Nama: $_name'),
>>                                     Text('Harga: $_price'),
>>                                     Text('Jumlah: $_amount'),
>>                                     Text('Deskripsi: $_description'),
>>                                   ],
>>                                 ),
>>                               ),
>>                               actions: [
>>                                 TextButton(
>>                                   child: const Text('OK'),
>>                                   onPressed: () {
>>                                     Navigator.pop(context);
>>                                   },
>>                                 ),
>>                               ],
>>                             );
>>                           },
>>                         );
>>                       }
>>                       _formKey.currentState!.reset();
>>                     },
>>                     child: const Text(
>>                       "Save",
>>                       style: TextStyle(color: Colors.white),
>>                     ),
>>                   ),
>>                 ),
>>               ),
>>             ],
>> ```
<br>

>> #### [ Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama. ]
>> Saya menggunakan `Navigator.push()` sehingga user dapat menekan tombol 'Tambah Produk' untuk menuju ke halaman form untuk menambahkan item baru. Bagian yang diubah adalah pada bagian widget `ShopCard` pada berkas `menu.dart` yang sudah ada.<br>
>> <img width="354" alt="image" src="https://github.com/adhan-857/pachill-market-mobile/assets/119088782/3c71423d-d89e-4ce6-a21f-db7678f18506"><br>
<br>

>> #### [ Membuat sebuah drawer pada aplikasi. ]
>> Pertama, saya membuat direktori baru bernama `widgets` dan menambahkan berkas baru bernama `left_drawer.dart`. Lalu, saya mengimpor halaman-halaman yang ingin dimasukkan navigasinya ke dalam Drawer Menu. Drawe yang saya buat akan memiliki 3 buah opsi.<br>
>> <img width="257" alt="image" src="https://github.com/adhan-857/pachill-market-mobile/assets/119088782/76bc2187-54a0-49d8-a53e-fbd9ac10b53b"><br>
>>
>> Lalu, saya memasukkan routing untuk halaman-halaman yang diimpor serta menghias Drawer tersebut. Sehingga saat kita memilih sebuah opsi pada Drawer, kita akan langsung diarahkan menuju halaman tersebut.<br>
>> ```
>>     return Drawer(
>>       child: ListView(
>>         children: [
>>           DrawerHeader(
>>             decoration: BoxDecoration(
>>               color: Color.fromARGB(255, 0, 94, 255),
>>             ),
>>             child: Column(
>>               children: [
>>                 RichText(
>>                   textAlign: TextAlign.center,
>>                   text: TextSpan(
>>                     children: [
>>                       TextSpan(
>>                         text: 'Pachill',
>>                         style: TextStyle(
>>                           fontSize: 30,
>>                           fontWeight: FontWeight.bold,
>>                           color: Colors.white,
>>                           fontFamily: 'UniSans',
>>                         ),
>>                       ),
>>                       TextSpan(
>>                         text: '.market',
>>                         style: TextStyle(
>>                           fontSize: 30,
>>                           fontWeight: FontWeight.bold,
>>                           color: Colors.yellow,
>>                           fontFamily: 'UniSans',
>>                         ),
>>                       ),
>>                     ],
>>                   ),
>>                 ),
>>                 Padding(padding: EdgeInsets.all(10)),
>>                 Text(
>>                   "Catat dan kelola seluruh stok supermarket kamu di sini!",
>>                   textAlign: TextAlign.center,
>>                   style: TextStyle(
>>                     fontSize: 15,
>>                     fontWeight: FontWeight.w500,
>>                     color: Colors.white,
>>                   ),
>>                 ),
>>               ],
>>             ),
>>           ),
>>           // TODO: Bagian routing
>>           ListTile(
>>             leading: const Icon(Icons.home_outlined),
>>             title: const Text('Halaman Utama'),
>>             // Bagian redirection ke MyHomePage
>>             onTap: () {
>>               Navigator.pushReplacement(
>>                   context,
>>                   MaterialPageRoute(
>>                     builder: (context) => MyHomePage(),
>>                   ));
>>             },
>>           ),
>>           ListTile(
>>             leading: const Icon(Icons.add_shopping_cart),
>>             title: const Text('Tambah Produk'),
>>             // Bagian redirection ke ShopFormPage
>>             onTap: () {
>>               Navigator.push(
>>                   context,
>>                   MaterialPageRoute(
>>                     builder: (context) => const ShopFormPage(),
>>                   ));
>>             },
>>           ),
>>           ListTile(
>>             leading: const Icon(Icons.shelves),
>>             title: const Text('Lihat Produk'),
>>             // Bagian redirection ke ListProductPage
>>             onTap: () {
>>               Navigator.push(
>>                 context,
>>                 MaterialPageRoute(
>>                   builder: (context) => const ListProductPage(),
>>                 ),
>>               );
>>             },
>>           ),
>>         ],
>>       ),
>>     );
>> ```
>>
>> Setelah itu, saya memasukkan Drawer tersebut ke halaman `menu.dart` agar dapat dibuka pada halaman tersebut.<br>
>> <img width="358" alt="image" src="https://github.com/adhan-857/pachill-market-mobile/assets/119088782/00f9297b-9af4-49c6-8b45-eaa5de29eda8"><br>
<br>
<br>

#### Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
`Navigator.push()` dan `Navigator.pushReplacement()` adalah dua metode yang berguna untuk menampilkan layar baru di Flutter. Perbedaan utama antara kedua metode ini adalah cara mereka menangani tumpukan layar. `Navigator.push()` akan menambahkan layar baru ke tumpukan layar, sedangkan `Navigator.pushReplacement()` akan mengganti layar yang ada di tumpukan layar dengan layar baru.<br>
<br>
* `Navigator.push()` dapat digunakan untuk menampilkan layar baru yang merupakan bagian dari alur aplikasi. Misalnya, kita dapat menggunakan `Navigator.push()` untuk menampilkan layar detail produk setelah pengguna memilih produk dari layar daftar produk.<br>

```
void _onProductSelected(Product product) {
  // Tampilkan layar detail produk
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetailsPage(product: product),
    ),
  );
}
```
<br>

* `Navigator.pushReplacement()` dapat digunakan untuk menampilkan layar baru yang menggantikan layar yang ada. Misalnya, kita dapat menggunakan `Navigator.pushReplacement()` untuk menampilkan layar login setelah pengguna menekan tombol keluar dari layar utama.<br>

```
void _onLogout() {
  // Ganti layar dengan layar login
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => LoginPage(),
    ),
  );
}
```
<br>
<br>

#### Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
`Container`
* ***Konteks Penggunaan:*** Container adalah salah satu layout widget paling dasar di Flutter. Ini digunakan untuk mengatur tata letak dan dekorasi dari elemen-elemen UI, seperti gambar, teks, atau widget lainnya. Kita dapat mengatur properti seperti warna latar belakang, margin, padding, dan sebagainya.
<br>

`Row` dan `Column`
* ***Konteks Penggunaan:*** Row dan Column digunakan untuk mengatur tata letak elemen-elemen UI dalam baris atau kolom, secara berurutan. Row digunakan untuk mengatur elemen-elemen secara horizontal, sementara Column digunakan untuk mengatur elemen-elemen secara vertikal. Kita dapat menggunakan mereka untuk menyusun tata letak sederhana seperti daftar atau toolbar.
<br>

`Stack`
* ***Konteks Penggunaan:*** Stack adalah widget yang digunakan untuk menumpuk (overlay) beberapa widget di atas satu sama lain. Kita dapat menggunakan Stack untuk membuat tata letak yang kompleks, seperti tumpukan kartu, tombol lapisan, atau efek-overlap.
<br>

`ListView`
* ***Konteks Penggunaan:*** ListView adalah widget yang digunakan untuk membuat daftar gulir (scrollable list) dari elemen-elemen. Ini cocok untuk menampilkan daftar item dalam aplikasi kita, seperti daftar kontak, berita, atau produk. ListView memiliki berbagai macam konstruktor, termasuk ListView.builder yang efisien untuk daftar panjang.
<br>

`GridView`
* ***Konteks Penggunaan:*** GridView adalah widget yang digunakan untuk menyusun elemen-elemen dalam bentuk grid. Kita dapat menggunakan GridView untuk menampilkan data dalam format berkolom dan berbaris, seperti galeri gambar atau aplikasi e-commerce dengan produk dalam grid.
<br>

`Wrap`
* ***Konteks Penggunaan:*** Wrap digunakan untuk mengatur elemen-elemen UI dalam kontainer yang dapat "melipat" elemen-elemen tersebut ke baris atau kolom baru jika mereka tidak cukup muat dalam satu baris atau kolom. Ini berguna untuk membuat tata letak yang responsif dan fleksibel.
<br>

`Expanded` dan `Flexible`
* ***Konteks Penggunaan:*** Expanded dan Flexible digunakan dalam tata letak Row dan Column untuk mengontrol cara elemen-elemen UI mengisi ruang yang tersedia. Kita dapat menggunakannya untuk memberikan bobot (weight) yang berbeda pada elemen-elemen dalam tata letak, sehingga mereka dapat berkembang atau berkontraksi sesuai kebutuhan.
<br>

`SizedBox`
* ***Konteks Penggunaan:*** SizedBox digunakan untuk mengatur ukuran widget dengan cara yang eksplisit. Kita dapat menggunakannya untuk memberikan widget ukuran tetap, baik dalam piksel atau persentase dari ruang yang tersedia.
<br>
<br>

#### Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
`TextFormField` untuk Nama Produk:
* ***Tujuan:*** Untuk mengumpulkan nama produk dari pengguna, disimpan sebagai `string`.
* ***Konteks Penggunaan:*** Ini digunakan agar pengguna dapat memasukkan nama produk yang akan ditambahkan. Teks yang dimasukkan akan disimpan dalam variabel `_name`.
<br>

`TextFormField` untuk Harga:
* ***Tujuan:*** Untuk mengumpulkan harga produk dari pengguna, disimpan sebagai `int`.
* ***Konteks Penggunaan:*** Ini digunakan agar pengguna dapat memasukkan harga produk dalam bentuk angka. Harga yang dimasukkan akan disimpan dalam variabel `_price`.
<br>

`TextFormField` untuk Jumlah:
* ***Tujuan:*** Untuk mengumpulkan jumlah produk dari pengguna, disimpan sebagai `int`.
* ***Konteks Penggunaan:*** Ini digunakan agar pengguna dapat memasukkan jumlah produk dalam bentuk angka. Jumlah yang dimasukkan akan disimpan dalam variabel `_amount`.
<br>

`TextFormField` untuk Deskripsi:
* ***Tujuan:*** Untuk mengumpulkan deskripsi produk dari pengguna, disimpan sebagai `string`.
* ***Konteks Penggunaan:*** Ini digunakan agar pengguna dapat memasukkan deskripsi produk. Deskripsi yang dimasukkan akan disimpan dalam variabel `_description`.
<br>

Setiap elemen input ini memiliki peran khusus dalam mengumpulkan informasi produk yang diperlukan untuk kemudian disimpan dalam daftar produk. Mereka juga memiliki validasi yang sesuai, seperti memastikan bahwa nama produk tidak boleh kosong, harga dan jumlah harus berupa angka, dan deskripsi tidak boleh kosong.<br>
<br>
<br>

#### Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean Architecture adalah pendekatan desain perangkat lunak yang fokus pada pemisahan kode menjadi beberapa lapisan (layers) dengan tujuan untuk meningkatkan pemeliharaan, skalabilitas, dan uji coba (testing) dalam sebuah aplikasi. Clean Architecture terdiri dari beberapa lapisan utama, yaitu:
<br>
* ***Lapisan Presentasi (Presentation Layer):***<br>
  * Ini adalah lapisan terluar yang berinteraksi langsung dengan pengguna dan mengatur tampilan dan UI aplikasi.<br>
  * Di dalam Flutter, lapisan ini sering dibangun dengan menggunakan widget dan mengandung tampilan UI serta logika tampilan.<br>
  * Widget seperti `Scaffold`, `AppBar`, `Form`, dan sebagainya digunakan untuk membuat tampilan UI.
<br>

* ***Lapisan Domain (Domain Layer):***
  * Ini adalah lapisan yang berisi bisnis logika dan aturan aplikasi. Ini tidak bergantung pada detail teknis seperti database atau UI.
  * Dalam aplikasi Flutter, lapisan ini biasanya berisi entitas (entities), use case, dan logika bisnis.
<br>

* ***Lapisan Data (Data Layer):***
  * Lapisan ini bertanggung jawab untuk berinteraksi dengan sumber data eksternal seperti database, API, atau penyimpanan lokal.
  * Pada aplikasi Flutter, Kita dapat menggunakan paket seperti http atau sqflite untuk berkomunikasi dengan sumber data eksternal.
<br>

Berikut adalah penerapan Clean Architecture pada aplikasi Flutter:
* ***Lapisan Presentasi:***
  * Widget Flutter, seperti `StatefulWidget` dan `StatelessWidget`, digunakan di lapisan presentasi untuk mengatur tampilan dan interaksi dengan pengguna.
  * Kita dapat memisahkan kode tampilan dan logika presentasi menggunakan widget-widget yang dikelompokkan sesuai dengan fungsinya.
  * Logika presentasi harus minimal, lebih mengarah pada menjalankan aksi pengguna dan memanggil use case dari lapisan domain.
<br>

* ***Lapisan Domain:***
  * Lapisan ini berisi entitas (entities) yang menggambarkan objek bisnis utama dalam aplikasi Kita.
  * Gunakan class Dart untuk mendefinisikan entitas ini dengan properti dan metode yang sesuai.
  * Lapisan ini juga berisi use case atau interaksi yang diizinkan oleh entitas.
<br>

* ***Lapisan Data:***
  * Lapisan ini bertanggung jawab untuk mengambil data dari sumber eksternal atau menyimpan data ke sumber eksternal.
  * Kita dapat membuat repositori (repository) yang bertanggung jawab untuk mengambil dan menyimpan data.
  * Gunakan model data (POJOs atau DTOs) untuk mengonversi data dari sumber eksternal menjadi format yang dapat digunakan oleh aplikasi dan sebaliknya.
<br>

* ***Dependency Injection (DI):***
  * Penggunaan Dependency Injection (DI) sangat dianjurkan dalam aplikasi Flutter dengan Clean Architecture.
  * DI membantu dalam menghubungkan lapisan-lapisan tersebut dan memastikan bahwa ketergantungan di lapisan presentasi dapat di-inject sehingga aplikasi menjadi lebih mudah diuji (unit testing) dan lebih fleksibel.
<br>

* ***Testing:***
  * Clean Architecture memungkinkan Kita untuk menguji setiap lapisan secara terpisah. Kita dapat melakukan unit testing pada logika bisnis di lapisan domain, menguji repositori di lapisan data, dan menguji tampilan UI di lapisan presentasi.
  * Flutter menyediakan alat dan framework untuk melakukan tes widget dan unit testing.
<br>
<br>