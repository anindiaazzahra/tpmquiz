import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: const Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12.0, 80.0, 12.0, 18.0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/zahra.jpeg'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Anindia Azzahra',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start, // Mengatur posisi teks ke kiri
                children: [
                  SizedBox(height: 10),
                  Text(
                    'NIM: 123210072',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kelas: Teknologi Dan Pemrograman Mobile IF-E',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Hobby: Berenang',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
