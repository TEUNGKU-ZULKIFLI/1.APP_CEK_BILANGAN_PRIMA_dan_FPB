import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cek Bilangan & FPB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Utama'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CekPrimaScreen()),
                );
              },
              child: Text('Cek Bilangan Prima'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FpbScreen()),
                );
              },
              child: Text('Hitung FPB'),
            ),
          ],
        ),
      ),
    );
  }
}

class CekPrimaScreen extends StatefulWidget {
  @override
  _CekPrimaScreenState createState() => _CekPrimaScreenState();
}

class _CekPrimaScreenState extends State<CekPrimaScreen> {
  TextEditingController _controller = TextEditingController();
  String result = "";

  bool cekPrima(int angka) {
    if (angka <= 1) return false;
    for (int i = 2; i <= angka ~/ 2; i++) {
      if (angka % i == 0) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Bilangan Prima'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan angka',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  int angka = int.tryParse(_controller.text) ?? 0;
                  if (cekPrima(angka)) {
                    result = '$angka adalah bilangan prima';
                  } else {
                    result = '$angka bukan bilangan prima';
                  }
                });
              },
              child: Text('Cek'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class FpbScreen extends StatefulWidget {
  @override
  _FpbScreenState createState() => _FpbScreenState();
}

class _FpbScreenState extends State<FpbScreen> {
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();
  String result = "";

  int hitungFpb(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung FPB'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controllerA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan angka A',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controllerB,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan angka B',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  int a = int.tryParse(_controllerA.text) ?? 0;
                  int b = int.tryParse(_controllerB.text) ?? 0;
                  int fpb = hitungFpb(a, b);
                  result = 'FPB dari $a dan $b adalah $fpb';
                });
              },
              child: Text('Hitung FPB'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
