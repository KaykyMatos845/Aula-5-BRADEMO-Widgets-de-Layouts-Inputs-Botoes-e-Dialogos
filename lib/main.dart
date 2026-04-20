import 'package:flutter/material.dart';
import 'exercicio2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercícios Brademo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const Exercicio2(),
    );
  }
}

class GridItem {
  final String location;
  final String name;
  final String imageUrl;

  GridItem({
    required this.location,
    required this.name,
    required this.imageUrl,
  });
}

class GridViewExercise extends StatelessWidget {
  const GridViewExercise({super.key});

  @override
  Widget build(BuildContext context) {
    final List<GridItem> items = [
      GridItem(
        location: 'Chennai',
        name: 'Flower Market',
        imageUrl: 'https://picsum.photos/id/20/600/600',
      ),
      GridItem(
        location: 'Tanjore',
        name: 'Bronze Works',
        imageUrl: 'https://picsum.photos/id/119/600/600',
      ),
      GridItem(
        location: 'Tanjore',
        name: 'Market',
        imageUrl: 'https://picsum.photos/id/164/600/600',
      ),
      GridItem(
        location: 'Tanjore',
        name: 'Thanjavur Temple',
        imageUrl: 'https://picsum.photos/id/1040/600/600',
      ),
      GridItem(
        location: 'Tanjore',
        name: 'Thanjavur Temple',
        imageUrl: 'https://picsum.photos/id/1048/600/600',
      ),
      GridItem(
        location: 'Pondicherry',
        name: 'Salt Farm',
        imageUrl: 'https://picsum.photos/id/1050/600/600',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Exercício 1 - GridView')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1.0,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(item.imageUrl, fit: BoxFit.cover),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87],
                        stops: [0.5, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12.0,
                    left: 12.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.location,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          item.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
