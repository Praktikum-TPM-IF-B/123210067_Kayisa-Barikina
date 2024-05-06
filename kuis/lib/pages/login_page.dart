import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/DummyMahasiswa.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

List<Mahasiswa> dataMahasiswa = getMahasiswa();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Page',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Tambahkan baris ini
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Masukkan username',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
              controller: username,
            ),
            SizedBox(height: 20), // Tambahkan baris ini
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Masukkan password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
              controller: password,
              obscureText: true,
            ),
            SizedBox(height: 20), // Tambahkan baris ini
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
              ),
              onPressed: () {
                for (var i = 0; i < dataMahasiswa.length; i++) {
                  if (username.text == dataMahasiswa[i].username &&
                      password.text == dataMahasiswa[i].password) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          mahasiswa: dataMahasiswa[i],
                        ),
                      ),
                    );
                    return;
                  }
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text("Login"),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
