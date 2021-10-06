import 'package:flutter/material.dart';

void main() {
  runApp(NuevaApp());
}

class NuevaApp extends StatelessWidget {
  const NuevaApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App para mostrar filas y columnas",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(),
    );
  }
}

Widget cuerpo() {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/originals/33/e8/03/33e8034a65d88c3682ac434d080b8437.jpg"),
            fit: BoxFit.cover)),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          titulo(),
          campoNumero1(),
          campoNumero2(),
          mostrarMensaje(),
          SizedBox(
            height: 10,
          ),
          botonSuma()
        ],
      ),
    ),
  );
}

Widget titulo() {
  return Text(
    "Suma de dos números",
    style: TextStyle(
        color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
  );
}

Widget campoNumero1() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
    child: TextField(
      keyboardType: TextInputType.number,
      controller: CNum1,
      decoration: InputDecoration(
        hintText: "Número 1: ",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

int numero1 = 0;
int numero2 = 0;
int resultado = 0;
final CNum1 = TextEditingController();
final CNum2 = TextEditingController();
final Tmensaje = TextEditingController();

Widget campoNumero2() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
    child: TextField(
      keyboardType: TextInputType.number,
      controller: CNum2,
      decoration: InputDecoration(
        hintText: "Número 2: ",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget botonSuma() {
  return ElevatedButton(
      onPressed: () {
        if ((CNum1.text == '') || (CNum2.text == '')) {
          Tmensaje.text = 'Deto ingresado no válidos';
        } else {
          numero1 = int.parse(CNum1.text);
          numero2 = int.parse(CNum2.text);
          resultado = numero1 + numero2;
          Tmensaje.text = resultado.toString();
          //CNum1.clear();
          //CNum2.clear();
        }
      },
      child: Text("Sumar"),
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ));
}

Widget mostrarMensaje() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
    child: TextField(
      controller: Tmensaje,
      decoration: InputDecoration(
        hintText: "Resultado",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}
