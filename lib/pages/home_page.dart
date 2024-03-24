import 'package:flutter/material.dart';
import 'package:flutter_application_1/DummyMahasiswa.dart';
import 'package:flutter_application_1/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  final Mahasiswa mahasiswa;
  const HomePage({
    Key? key,
    required this.mahasiswa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Mahasiswa> dataMahasiswa = getMahasiswa();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hi, ${mahasiswa.nama}"),
          backgroundColor: Colors.pink,
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(mahasiswa: mahasiswa, nim: mahasiswa.nim),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 25,
                  color: Colors.pink,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                width: MediaQuery.of(context).size.width * 0.5,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Daftar Mahasiswa",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.people,
                      size: 20,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height * 0.8,
                margin: const EdgeInsets.only(left: 15),
                child: ListView.builder(
                  itemCount: dataMahasiswa.length,
                  itemBuilder: (context, index) {
                    return dataMahasiswa[index].nim == mahasiswa.nim
                        ? Container()
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    mahasiswa: dataMahasiswa[index],
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          dataMahasiswa[index].nama,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          dataMahasiswa[index]
                                              .tahunMasuk
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      dataMahasiswa[index].nim,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.pink,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
