import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BizCard extends StatelessWidget {
  const BizCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("BizCard"),
      centerTitle: true,
    ),
    body: Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          getcard(),
          getAvatar()
        ],
      ),
    ),);
  }

  Container getcard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.indigo.shade100,
        borderRadius: BorderRadius.circular(10.0),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Madhu", style: TextStyle(
            fontSize: 20.8,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.black,



          ),),
          Text("satmadhu01@gmail.com"),
          Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_outline),
            Text("T: @Build apps with me")
          ],)
        ],
      ),
    );
  }

  Container getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.redAccent, width: 1.2,
        ),
        image: DecorationImage(image: NetworkImage("https://picsum.photos/300/300"),
        fit: BoxFit.cover)
      ),
    );
  }
}



//context knows the location of a widget in the widget tree




