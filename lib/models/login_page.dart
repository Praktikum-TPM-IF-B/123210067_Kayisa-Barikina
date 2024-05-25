import 'package:flutter/material.dart';
import 'package:responsi_kayisa/models/home_page.dart';
// import 'package:responsi_kayisa/models/home_page.dart';
// import 'package:responsi_kayisa/models/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

var data = [
  {'username': 'admin', 'password': 'admin'},
  {'username': 'user', 'password': 'user'},
];

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
              'Amiibo Game',
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
              onPressed: () {
                for (var i = 0; i < data.length; i++) {
                  if (username.text == data[i]['username'] &&
                      password.text == data[i]['password']) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => HomePage())));
                    return;
                  }
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text("Masuk"),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
