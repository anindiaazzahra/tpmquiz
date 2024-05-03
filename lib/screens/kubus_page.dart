import 'package:flutter/material.dart';

class KubusPage extends StatefulWidget {
  const KubusPage({Key? key}) : super(key: key);

  @override
  _KubusPageState createState() => _KubusPageState();
}

class _KubusPageState extends State<KubusPage> {
  final TextEditingController sisiController = TextEditingController();
  String luas = '';
  String volume = '';

  void _calculate() {
    double sisi = double.tryParse(sisiController.text) ?? 0;

    // Menghitung keliling kubus
    double l = 12 * sisi;

    // Menghitung volume kubus
    double v = sisi * sisi * sisi;

    setState(() {
      luas = l.toStringAsFixed(2);
      volume = v.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Kubus Kalkulator',
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
                controller: sisiController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Panjang Sisi'),
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
                        'Keliling\n$luas',
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
                        'Volume\n$volume',
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
