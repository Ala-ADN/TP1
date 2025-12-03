import 'package:flutter/material.dart';
import '../../models/book.dart';
import 'home_cell.dart';
import '../../Screens/Details/details_screen.dart';
import '../../Screens/LibraryScreen/library_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final books = <Book>[
      Book(
        "Charles Aznavour",
        35,
        'assets/2014.06.23._Charles_Aznavour_Fot_Mariusz_Kubik_01.jpg',
      ),
      Book("1984", 28, 'assets/71wANojhEKL._AC_UF1000,1000_QL80_.jpg'),
      Book("Les Fleurs du Mal", 25, 'assets/les-fleurs-du-mal-83490.jpg'),
      Book("Métamorphose", 30, 'assets/1_acGO1ByIz_G7kG9IspqP9Q.jpg'),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2E7D32), Color(0xFF66BB6A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          "📚 Store INSAT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LibraryScreen(books: books)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final b = books[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailsScreen(book: b)),
              );
            },
            child: HomeCell(b),
          );
        },
      ),
    );
  }
}
