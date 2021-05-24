import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        final snackBar = SnackBar(content: Text("hello again!"),
        backgroundColor: Colors.redAccent,);
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(7.0)
        ),
        child: Text("Button", style: TextStyle(fontSize: 25.0),),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Center(child: Text("Hello flutter!!", textDirection: TextDirection.ltr),);

    return Material(
        color: Colors.blueAccent,
        child: Center(
          child: Text("Hello flutter!!", textDirection: TextDirection.ltr,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25.6,
              fontStyle: FontStyle.italic,
            ),),
        ));
  }
}
