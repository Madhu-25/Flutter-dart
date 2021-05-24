import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Wisdom extends StatefulWidget {
  const Wisdom({Key key}) : super(key: key);

  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int counter = 0;
  List quotes = [
    "The greatest glory in living lies not in never falling, but in rising every time we fall.",
    "The way to get started is to quit talking and begin doing.",
    "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking.",
    "If life were predictable it would cease to be life, and be without flavor.",
    "Spread love everywhere you go. Let no one ever come to you without leaving happier.",
    "Always remember that you are absolutely unique. Just like everyone else.",
    "The future belongs to those who believe in the beauty of their dreams.",
    "The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.",
    "It is during our darkest moments that we must focus to see the light.",
    "The only impossible journey is the one you never begin.",
    "Life is never fair, and perhaps it is a good thing for most of us that it is not."
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded( //full screen

              child: Center(
                child: Container(
                  width: 350,
                  height: 150,
                  margin: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Center(
                    child: Text(quotes[counter], style: TextStyle(
                      fontSize: 17.5, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500
                    ),),
                  ),
                ),
              ),
            ),
            Divider(thickness: 2.5, color: Colors.blueAccent.shade100 ,),
            Padding(
              padding: const EdgeInsets.only( top: 8.0),
              child: FlatButton.icon(onPressed: _showQuote, icon: Icon(Icons.wb_sunny), color: Colors.indigoAccent, label: Text("Inspire me!", style: TextStyle(
                color: Colors.white, fontSize: 18.2
              ),)),
            ),
            Spacer( //pushes to the top as much possible

            )
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {

      if(counter==quotes.length-1)
      {
        counter=0;
      }
      else{
        counter = counter+1;
      }
    });

  }
}
