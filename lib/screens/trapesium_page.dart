import 'package:flutter/material.dart';

class TrapesiumPage extends StatefulWidget {
  const TrapesiumPage({Key? key}) : super(key: key);

  @override
  _TrapesiumPageState createState() => _TrapesiumPageState();
}

class _TrapesiumPageState extends State<TrapesiumPage> {
  final TextEditingController sisiAController = TextEditingController();
  final TextEditingController sisiBController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  final TextEditingController sisiMiring1Controller = TextEditingController();
  final TextEditingController sisiMiring2Controller = TextEditingController();
  String luas = '';
  String keliling = '';

  void _calculate() {
    double sisiA = double.tryParse(sisiAController.text) ?? 0;
    double sisiB = double.tryParse(sisiBController.text) ?? 0;
    double tinggi = double.tryParse(tinggiController.text) ?? 0;
    double sisiMiring1 = double.tryParse(sisiMiring1Controller.text) ?? 0;
    double sisiMiring2 = double.tryParse(sisiMiring2Controller.text) ?? 0;

    // Menghitung luas trapesium
    double l = 0.5 * (sisiA + sisiB) * tinggi;

    // Menghitung keliling trapesium
    double k = sisiA + sisiB + sisiMiring1 + sisiMiring2;

    setState(() {
      luas = l.toStringAsFixed(2);
      keliling = k.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Trapesium Kalkulator',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: sisiAController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Panjang Sisi A'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: sisiBController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Panjang Sisi B'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: tinggiController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Tinggi'),
              ),
              TextField(
                controller: sisiMiring1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Panjang Sisi Miring 1'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: sisiMiring2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Panjang Sisi Miring 2'),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _calculate,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(320, 60),
                ),
                child: const Text(
                  'HITUNG',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 160,
                      height: 100,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Luas\n$luas',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 100,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Keliling\n$keliling',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
