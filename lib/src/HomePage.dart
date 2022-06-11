import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('data', style: TextStyle(),),
        ElevatedButton(
          onPressed: (){}, 
          child: Text('data')
        ),
      ],
    );
  }
}