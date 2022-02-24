import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(title: "Calculadora"));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _result = 0;
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();

  @override
  void dispose() {
    _number1Controller.dispose();
    _number2Controller.dispose();
    super.dispose();
  }

  void _sum() {
    setState(() {
      this._result = int.parse(_number1Controller.text) +
          int.parse(_number2Controller.text);
    });
  }

  void _subtract() {
    setState(() {
      this._result = int.parse(_number1Controller.text) -
          int.parse(_number2Controller.text);
    });
  }

  void _div() {
    setState(() {
      this._result = int.parse(_number1Controller.text) ~/
          int.parse(_number2Controller.text);
    });
  }

  void _multiply() {
    setState(() {
      this._result = int.parse(_number1Controller.text) *
          int.parse(_number2Controller.text);
    });
  }

  void _clear() {
    setState(() {
      this._result = 0;
      this._number1Controller.clear();
      this._number2Controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soma"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Text('Valor 1: '),
                Expanded(
                    child: TextField(
                  controller: _number1Controller,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    suffixIcon: Icon(Icons.calculate_sharp),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20),
                  ),
                ))
              ],
            ),
            Row(
              children: [
                Text(
                  'Valor 2: ',
                ),
                Expanded(
                    child: TextField(
                  controller: _number2Controller,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    suffixIcon: Icon(Icons.calculate_sharp),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20),
                  ),
                ))
              ],
            ),
            SizedBox(height: 30),
            Text("Resultado: ${this._result}"),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _sum, child: Text("+")),
                ElevatedButton(onPressed: _subtract, child: Text("-")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _div, child: Text("/")),
                ElevatedButton(onPressed: _multiply, child: Text("*")),
              ],
            ),
            ElevatedButton(onPressed: _clear, child: Text("Limpar")),
          ],
        ),
      ),
    );
  }
}
