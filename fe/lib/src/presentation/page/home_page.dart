import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name;

  const HomePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chào mừng, $name'),
      ),
      body: const Center(
        child: Text(
          'Đây là màn hình Home',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
