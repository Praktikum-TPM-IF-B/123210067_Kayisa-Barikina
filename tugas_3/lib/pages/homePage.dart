import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tugas_3/models/album.dart';
import 'package:tugas_3/models/user.dart';
import 'package:tugas_3/pages/detailPage.dart';
import 'package:tugas_3/services/albumService.dart';
import 'package:tugas_3/services/userService.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.centerLeft,
              child: Text("List Album", style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Container(
              child: FutureBuilder<List<dynamic>>(
                        future: AlbumData.instance.loadAllData(),
                        builder: (context, snapshot) {
                          if(snapshot.hasData){
                            List? data = snapshot.data;
                            return _dataDisplay(data!, context);
                          }
                          if(snapshot.hasError){
                            return Text("Terdapat Error");
                          }
                          return LinearProgressIndicator();
                        },
                      ),
            ),
          ],
      ),
    ),
    );
  }
}

Widget _dataDisplay(List list, BuildContext context){
  return Expanded(
    child: ListView.builder(
      scrollDirection: Axis.vertical,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  Album album = Album();
                                  album.id = list[index]['id'];
                                  album.userId = list[index]['userId'];
                                  album.title = list[index]['title'];
                                  return DetailPage(album: album,);
                                },),);
                              },
                              child: Card(
                                color: Colors.pink,
                                child: Container(
                                  height: MediaQuery.sizeOf(context).height * 0.15,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
                                            color: Colors.white
                                          ),
                                          height: MediaQuery.sizeOf(context).height,
                                          padding: EdgeInsets.all(20),
                                          child: Text("${list[index]['title']}", style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: FutureBuilder(future: UserData.instance.loadData(list[index]['userId']), builder: (context, AsyncSnapshot<dynamic> snapshot) {
                                          if(snapshot.hasData){
                                            User user = User.fromJson(snapshot.data);
                                            return Container(
                                              height: MediaQuery.sizeOf(context).height,
                              
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Text("${user.name}", style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                    textAlign: TextAlign.left,),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(context).width,
                                                    child: Text("${user.username}" , style: TextStyle(
                                                      color: Colors.white), textAlign: TextAlign.left,),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                          return LinearProgressIndicator(
                                          );
                                        },),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        ),
  );
}
