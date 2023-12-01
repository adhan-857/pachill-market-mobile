import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pachill_market/screens/menu.dart';
import 'package:pachill_market/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({Key? key}) : super(key: key);

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name1 = "";
  int _price = 0;
  int _amount = 0;
  String _description = "";

  String _nameError = "";
  String _priceError = "";
  String _amountError = "";
  String _descriptionError = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 94, 255),
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name1 = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        _nameError = "Nama tidak boleh kosong!";
                      });
                      return "Nama tidak boleh kosong!";
                    }
                    setState(() {
                      _nameError = "";
                    });
                    return null;
                  },
                ),
              ),
              if (_nameError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _nameError,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga",
                    labelText: "Harga",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        _priceError = "Harga tidak boleh kosong!";
                      });
                      return "Harga tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      setState(() {
                        _priceError = "Harga harus berupa angka!";
                      });
                      return "Harga harus berupa angka!";
                    }
                    setState(() {
                      _priceError = "";
                    });
                    return null;
                  },
                ),
              ),
              if (_priceError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _priceError,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Jumlah",
                    labelText: "Jumlah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        _amountError = "Jumlah tidak boleh kosong!";
                      });
                      return "Jumlah tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      setState(() {
                        _amountError = "Jumlah harus berupa angka!";
                      });
                      return "Jumlah harus berupa angka!";
                    }
                    setState(() {
                      _amountError = "";
                    });
                    return null;
                  },
                ),
              ),
              if (_amountError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _amountError,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        _descriptionError = "Deskripsi tidak boleh kosong!";
                      });
                      return "Deskripsi tidak boleh kosong!";
                    }
                    setState(() {
                      _descriptionError = "";
                    });
                    return null;
                  },
                ),
              ),
              if (_descriptionError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _descriptionError,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 0, 94, 255)),
                    ),
onPressed: () async {
  if (_formKey.currentState!.validate()) {
    // Membuat data produk dalam bentuk map
    Map<String, dynamic> productData = {
      'name1': _name1,  // Sesuaikan dengan nama field di model Django
      'price': _price,
      'amount': _amount,
      'description': _description,
    };

    // Mengubah data produk menjadi JSON
    String body = json.encode(productData);

    // URL server Django Anda
    String url = 'http://127.0.0.1:8000/create-flutter/';

    // Melakukan request POST ke server Django
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      // Jika berhasil, tampilkan dialog sukses
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Produk berhasil tersimpan'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama: $_name1'),
                  Text('Harga: $_price'),
                  Text('Jumlah: $_amount'),
                  Text('Deskripsi: $_description'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else {
      // Jika gagal, tampilkan error
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Gagal menyimpan produk'),
            content: SingleChildScrollView(
              child: Text('Server Error: ${response.statusCode}'),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    // Reset form setelah proses selesai
    _formKey.currentState!.reset();
  }
},

                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}