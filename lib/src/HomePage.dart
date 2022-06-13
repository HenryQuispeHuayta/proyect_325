import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          'Flutter: Column, Row, Image, Fonts, ElevatedButton, ButtonNavigatorBar',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 20,),
        const Text(
          'Henry Quispe Huayta',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        const Text(
          'Column y Row',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: Colors.blue),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: Colors.red),
            ),
          ],
        ),
        const Text(
          'Image',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Ralewey',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
        ),
        Image.asset(
          'assets/imgs/logo.jpg',
          color: Colors.amber,
          colorBlendMode: BlendMode.darken,
        ),
        Image(image: NetworkImage('http://www.fcpn.edu.bo/wp-content/uploads/2021/08/EscudoFCPN.png')),
        const Text(
          'ElevatedButton',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: const Text('Alerta'),
                        content: const Text('alerta'),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: const Text('presionar')
                          )
                        ],
                      ));
            },
            child: Text('data')),
      ],
    );
  }
}
