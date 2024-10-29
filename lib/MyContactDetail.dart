import 'package:flutter/material.dart';

class MyContactDetail extends StatelessWidget {
  MyContactDetail(this.data,);

  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Details'),
      ),
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
              image: NetworkImage(data['picture']['large']),
            ),
          ),
        ),
      ),
    );
  }
}