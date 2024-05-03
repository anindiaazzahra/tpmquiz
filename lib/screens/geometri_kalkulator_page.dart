import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GeometriPage extends StatefulWidget {
  const GeometriPage({super.key});

  @override
  State<GeometriPage> createState() => _GeometriPageState();
}

class _GeometriPageState extends State<GeometriPage> {

  Widget _customElevatedButton({required String text, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.white10),
          ),
          minimumSize: const Size(320, 80),
          backgroundColor: Colors.blueGrey,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kalkulator Geometri',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _customElevatedButton(
                text: 'Trapesium',
                onPressed: () {
                  context.goNamed("trapesium");
                },
              ),
              _customElevatedButton(
                text: 'Kubus',
                onPressed: () {
                  context.goNamed("kubus");
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}
