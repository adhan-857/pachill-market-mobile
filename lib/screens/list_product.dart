import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pachill_market/models/product.dart';
import 'package:pachill_market/widgets/left_drawer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProduct() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse('http://127.0.0.1:8000/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Product> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Product.fromJson(d));
      }
    }
    return list_product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Daftar Produk',
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
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data produk.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                }
                else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                        var product = snapshot.data![index].fields; // Assuming this is how you access the product fields

                        return GestureDetector( // or InkWell for a ripple effect
                            onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                        return AlertDialog(
                                            title: Container(
                                                padding: const EdgeInsets.all(12.0),
                                                color: Color.fromARGB(255, 0, 94, 255), // Set the background color to blue
                                                width: double.infinity, // Ensure the Container fills the width
                                                alignment: Alignment.center, // Align the text to the center
                                                child: Text(
                                                    'Detail Produk',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                ),
                                            ),
                                            content: Column(
                                                mainAxisSize: MainAxisSize.min, // To prevent overflow
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                Text(
                                                  "${snapshot.data![index].fields.name1}",
                                                  style: const TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text("Harga: Rp. ${snapshot.data![index].fields.price},-"),
                                                const SizedBox(height: 10),
                                                Text("Jumlah: ${snapshot.data![index].fields.amount} buah"),
                                                const SizedBox(height: 5),
                                                Text(""),
                                                Text("Deksripsi:"),
                                                Text(
                                                  "${snapshot.data![index].fields.description}")
                                                ],
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
                            },
                            child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            "${product.name1}",
                                            style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text("${product.amount} buah"),
                                        const SizedBox(height: 10),
                                        Text("${product.description}")
                                    ],
                                ),
                            ),
                        );
                    },
                );
                }
              }
            }));
  }
}