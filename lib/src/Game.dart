import 'dart:io';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<List<String>> dato = [];
  List<String> lista = [];
  String xo = 'o';
  int cont = 0;

  @override
  void initState() {
    // TODO: implement initState
    matriz();
  }

  matriz() {
    for (int i = 0; i < 3; i++) {
      List<String> st = [];
      for (int j = 0; j < 3; j++) {
        st.add('');
      }
      dato.add(st);
      // lista.add('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Turno de $xo',
            style: TextStyle(fontSize: 60),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              elemento(0, 0),
              elemento(0, 1),
              elemento(0, 2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              elemento(1, 0),
              elemento(1, 1),
              elemento(1, 2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              elemento(2, 0),
              elemento(2, 1),
              elemento(2, 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget elemento(int x, int y) {
    return Container(
        width: 90,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle, border: Border.all(color: Colors.black)),
        child: TextButton(
          onPressed: () {
            llenar(x, y);
            ganador(x, y);
            cont++;
          },
          child: Text(
            dato[x][y],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 100),
          ),
        ));
  }

  llenar(int x, int y) {
    setState(() {
      if (dato[x][y] == '') {
        if (xo == 'o') {
          dato[x][y] = 'x';
        } else {
          dato[x][y] = 'o';
        }
        xo = dato[x][y];
      }
    });
  }

  ganador(int x, int y) {
    int a = 0, b = 0, c = 0, d = 0;
    int n = dato.length - 1;
    String jugador = dato[x][y];
    for (int i = 0; i < dato.length; i++) {
      if (dato[x][i] == jugador) a++;
      if (dato[i][y] == jugador) b++;
      if (dato[i][i] == jugador) c++;
      if (dato[i][n - i] == jugador) d++;
    }
    if (a == n + 1 || b == n + 1 || c == n + 1 || d == n + 1) {
      showDialog(
        context: context,
        builder: (BuildContext context) => alerta('$jugador gano')
      );
    }
    if (cont >= 8) {
      showDialog(
          context: context,
          builder: (BuildContext context) => alerta('Empate'));
    }
  }

  AlertDialog alerta(String alerta) {
    return AlertDialog(
      title: Text(alerta),
      content: const Text('Volver a jugar?'),
      actions: [
        TextButton(onPressed: () => exit(0), child: const Text('No')),
        TextButton(
            onPressed: () {
              Navigator.pop(context, 'Si');
              setState(() {
                dato.clear();
                matriz();
                xo = 'o';
                cont = 0;
              });
            },
            child: const Text('Si')),
      ],
    );
  }
}
