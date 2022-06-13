import 'package:flutter/material.dart';

import 'Calculadora.dart';
import 'Game.dart';
import 'HomePage.dart';

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _n = 0;
  final List<Widget> _bnv = [const HomePage(), Game(), Calculadora()];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto INF-325',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Proyecto INF-325', 
            style: TextStyle(color: Colors.black)
          ),
          backgroundColor: Colors.white,
        ),
        body: _bnv[_n],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: 'Juego'),
            BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calculadora'),
          ],
          currentIndex: _n,
          onTap: (index){
            setState(() {
              _n = index;
            });
          },
        ),
      ),
    );
  }
}