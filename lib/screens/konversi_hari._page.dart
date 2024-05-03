import 'package:flutter/material.dart';

class KonversiHariPage extends StatefulWidget {
  const KonversiHariPage({Key? key}) : super(key: key);

  @override
  _KonversiHariPageState createState() => _KonversiHariPageState();
}

class _KonversiHariPageState extends State<KonversiHariPage> {
  final TextEditingController hariController = TextEditingController();
  String hari = '';

  void _convertDay() {
    int inputHari = int.tryParse(hariController.text) ?? 0;

    // Konversi angka hari menjadi nama hari
    switch (inputHari) {
      case 1:
        setState(() {
          hari = 'Senin';
        });
        break;
      case 2:
        setState(() {
          hari = 'Selasa';
        });
        break;
      case 3:
        setState(() {
          hari = 'Rabu';
        });
        break;
      case 4:
        setState(() {
          hari = 'Kamis';
        });
        break;
      case 5:
        setState(() {
          hari = 'Jumat';
        });
        break;
      case 6:
        setState(() {
          hari = 'Sabtu';
        });
        break;
      case 7:
        setState(() {
          hari = 'Minggu';
        });
        break;
      default:
        setState(() {
          hari = 'Hari tidak valid';
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Konversi Hari',
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
                controller: hariController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Masukkan Hari ke-'),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _convertDay,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(320, 60),
                ),
                child: const Text(
                  'KONVERSI',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 160,
                  height: 100,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Hari\n$hari',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
