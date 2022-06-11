import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculadora extends StatefulWidget {
  Calculadora({Key? key}) : super(key: key);

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String ec = '0';
  String res = ' ';
  String a = '';
  double ecT = 38;
  double resT = 48;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Text(
            ec,
            style: TextStyle(fontSize: ecT),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Text(
            res,
            style: TextStyle(fontSize: resT),
          ),
        ),
        const Expanded(child: Divider()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .75,
              child: Table(
                children: [
                  TableRow(
                    children: [
                      boton('C', 1, Colors.red),
                      boton('⌫', 1, Colors.red),
                      boton('÷', 1, Colors.green),
                    ]
                  ),
                  TableRow(
                    children: [
                      boton('7', 1, Colors.white),
                      boton('8', 1, Colors.white),
                      boton('9', 1, Colors.white),
                    ]
                  ),
                  TableRow(
                    children: [
                      boton('4', 1, Colors.white),
                      boton('5', 1, Colors.white),
                      boton('6', 1, Colors.white),
                    ]
                  ),
                  TableRow(
                    children: [
                      boton('1', 1, Colors.white),
                      boton('2', 1, Colors.white),
                      boton('3', 1, Colors.white),
                    ]
                  ),
                  TableRow(
                    children: [
                      boton('0', 1, Colors.white),
                      boton('.', 1, Colors.white),
                      boton('0', 1, Colors.white),
                    ]
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Table(
                children: [
                  TableRow(
                    children: [
                      boton('×', 1, Colors.green),
                    ]
                  ),
                  TableRow(
                    children: [
                      boton('-', 1, Colors.green),
                    ]
                  ),
                  TableRow(
                    children: [
                      boton('+', 1, Colors.green),
                    ]
                  ),
                  TableRow(
                    children: [
                      boton('=', 2, Colors.green),
                    ]
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget boton(String texto, double height, Color color) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Container(
        height: MediaQuery.of(context).size.height * .1 * height,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.blueAccent)
        ),
        child: TextButton(
          onPressed: () {
            calculo(texto);
          },
          child: Text(
            texto,
            style: TextStyle(
                fontSize: 30.0, 
                fontWeight: FontWeight.normal, 
                color: color
            ),
          ),
        ),
      ),
    );
  }

  calculo(String texto){
    setState(() {
      if(texto == 'C'){
        ec = '0';
        res = ' ';
        ecT = 48;
        resT = 38;
      }else if(texto == '⌫'){
        ec = ec.substring(0, ec.length - 1);
        ecT = 48;
        resT = 38;
        res = '0';

      }else if(texto == '='){
        a = ec;
        a = a.replaceAll('×', '*');
        a = a.replaceAll('÷', '/');
        ecT = 38;
        resT = 48;
        
        try{
          Parser p = Parser();
          Expression ex = p.parse(a);
          ContextModel cm = ContextModel();
          res = '${ex.evaluate(EvaluationType.REAL, cm)}'; 
        }catch(e){
          res = 'error';
        }
      }else{
        if(ec == '0'){
          ec = texto;
        }else{
          ec = ec + texto;
        }
      }
    });
  }
      
}
// decoration: ShapeDecoration(
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(0.0),
//     side: BorderSide(
//       color: Colors.white,
//       width: 1,
//       style: BorderStyle.solid
//     ),
//   ),
// ),
