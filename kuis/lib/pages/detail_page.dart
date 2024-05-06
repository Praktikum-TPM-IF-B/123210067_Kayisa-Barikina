import 'package:flutter/material.dart';
import 'package:flutter_application_1/DummyMahasiswa.dart';

class DetailPage extends StatelessWidget {
  final Mahasiswa mahasiswa;
  final String? nim;
  const DetailPage({
    Key? key,
    required this.mahasiswa,
    this.nim,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: nim != null ? Text("Profile Anda") : Text('Profile Teman'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      mahasiswa.nama,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'NIM',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    hintText: '${mahasiswa.nim}',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'IPK',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabled: false,
                                    hintText: '${mahasiswa.ipk}',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tahun Masuk',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabled: false,
                                    hintText: '${mahasiswa.tahunMasuk}',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total SKS diambil',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabled: false,
                                    hintText: '${mahasiswa.totalSKS}',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Semester Saat ini',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabled: false,
                                    hintText: '${mahasiswa.semesterSaatIni}',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
