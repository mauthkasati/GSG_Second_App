import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestYourself extends StatelessWidget {
  const TestYourself({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Text('test'),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const TestYourself(),
                ),
              );
            },
            icon: Icon(
              Icons.favorite,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
