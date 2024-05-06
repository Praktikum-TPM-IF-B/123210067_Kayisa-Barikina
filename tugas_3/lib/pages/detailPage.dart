import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tugas_3/models/album.dart';
import 'package:tugas_3/models/user.dart';
import 'package:tugas_3/services/albumService.dart';
import 'package:tugas_3/services/userService.dart';

class DetailPage extends StatefulWidget {
  final Album album;

  const DetailPage({super.key, required this.album,});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text("${widget.album.title}"),
      ),
      body: Column(
        children: [
          FutureBuilder(future: AlbumData.instance.loadGambar(widget.album.id), builder: (context, snapshot) {
            List? dataGambar = snapshot.data;
            if(snapshot.hasData){
              return _listData(dataGambar!, context);
            }
            if(snapshot.hasError){
              return Text("Terjadi Error");
            }
            return LinearProgressIndicator();
          },)
        ],
      ),
    );
  }
}

Widget _listData(List data, BuildContext context) {
  return Expanded(
    child: ListView.builder(itemCount: data.length, scrollDirection: Axis.vertical, itemBuilder: (context, index) {
      return Container(
        height: MediaQuery.sizeOf(context).height *0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network('${data[index]['url']}'),
            Expanded(
              child: FutureBuilder(future: AlbumData.instance.loadAlbum(data[index]['albumId']), builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.hasData){
                  Album album = Album.fromJson(snapshot.data);
                  String listAlbum = data[index]['title'];
                  return _userDisplay(album.id, context, listAlbum);
                }
                if(snapshot.hasError){
                  return Text("Terdapat Error");
                }
                return LinearProgressIndicator();
              },),
            )
          ],
        ),
      );
    },),
  );
}

Widget _userDisplay(int? id, BuildContext context, String title){
  return Expanded(
    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
          future: UserData.instance.loadData(id),
          builder: (context,AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasData){
              User? user = User.fromJson(snapshot.data);
            return Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,child: Text('${title}', textAlign: TextAlign.left, style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),),),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${user.name}', textAlign: TextAlign.end,),
                        Text('${user.username}', textAlign: TextAlign.end,)
                      ],
                    ),
                  ),
              ],
            );
            }
            if(snapshot.hasError){
              return Text("Terdapat Kesalahan");
            }
            return LinearProgressIndicator();
            
          }
        ),
      ),
    ),
  );
}