import 'package:flutter/material.dart';

// Buat sebuah list sementara untuk menyimpan produk
List<Map<String, dynamic>> productList = [];

class ListProductPage extends StatelessWidget {
  const ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 94, 255),
      ),
      body: productList.isEmpty
          ? Center(
              child: Text('Belum ada produk yang ditambahkan.'
              ),
            )
          : ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return ListTile(
                  title: Text(product['name']),
                  subtitle: Text('Harga: ${product['price']}, Jumlah: ${product['amount']}'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Detail Produk'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nama: ${product['name']}'),
                              Text('Harga: ${product['price']}'),
                              Text('Jumlah: ${product['amount']}'),
                              Text('Deskripsi: ${product['description']}'),
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
                );
              },
            ),
    );
  }
}
