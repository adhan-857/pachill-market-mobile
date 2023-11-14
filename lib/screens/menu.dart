import 'package:flutter/material.dart';
import 'package:pachill_market/screens/shoplist_form.dart';
import 'package:pachill_market/screens/list_product.dart';
import 'package:pachill_market/widgets/left_drawer.dart';
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
        ShopItem("Lihat Produk", Icons.shelves),
        ShopItem("Tambah Produk", Icons.add_shopping_cart),
        ShopItem("Logout", Icons.logout),
    ];

    @override
    Widget build(BuildContext context) {
      // This method is rerun every time setState is called, for instance as done
      // by the _incrementCounter method above.
      //
      // The Flutter framework has been optimized to make rerunning build methods
      // fast, so that you can just rebuild anything that needs updating rather
      // than having to individually change instances of widgets.
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 94, 255),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Pachill',
                  style: TextStyle(
                    fontFamily: 'UniSans',
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                TextSpan(
                  text: '.market',
                  style: TextStyle(
                    fontFamily: 'UniSans',
                    color: Colors.yellow,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: const LeftDrawer(),
            body: SingleChildScrollView(
              // Widget wrapper yang dapat discroll
              child: Padding(
                padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                child: Column(
                  // Widget untuk menampilkan children secara vertikal
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                      child: Text(
                        'Pengelola Supermarket Idaman Kamu :D', // Text yang menandakan toko
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Grid layout
                    GridView.count(
                      // Container pada card kita.
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: items.map((ShopItem item) {
                        // Iterasi untuk setiap item
                        return ShopCard(item);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
    }
}

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

    return Material(
      color: backgroundColor, // Apply the determined color
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
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
                builder: (context) => const ListProductPage(),
              ),
            );
          }
          else {
            // Memunculkan SnackBar untuk item lainnya
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!"),
              ),
            );
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