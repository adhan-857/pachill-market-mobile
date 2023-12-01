import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pachill_market/screens/list_product.dart';
import 'package:pachill_market/screens/login.dart';
import 'package:pachill_market/screens/shoplist_form.dart';

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    switch (item.name) {
      case "Tambah Produk":
        backgroundColor = Colors.green;
        break;
      case "Logout":
        backgroundColor = Colors.red;
        break;
      default:
        backgroundColor = Colors.indigo;
    }

    final request = context.watch<CookieRequest>();

    return Material(
      color: backgroundColor, // Apply the determined color
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Produk") {
            // Pindah ke halaman ShopFormPage ketika "Tambah Produk" ditekan
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ShopFormPage(),
              ),
            );
          }
          else if (item.name == "Lihat Produk") {
            // Pindah ke halaman ShopFormPage ketika "Lihat Produk" ditekan
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductPage(),
              ),
            );
          }
          else if (item.name == "Logout") {
                      final response = await request.logout(
                          // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                          "http://127.0.0.1:8000/auth/logout/");
                      String message = response["message"];
                      if (response['status']) {
                        String uname = response["username"];
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$message Sampai jumpa, $uname."),
                        ));
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$message"),
                        ));
                      }
                    }
                  },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}