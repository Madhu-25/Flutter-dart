import 'package:first_app/UI/util/hexcolor.dart';
import 'package:first_app/model/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentIndex = 0;
  List questionBank =[
    Question.name("India became a republic nation in 1950", true),
    Question.name("Vande Mataram was written by Rabindranath Tagore", false),
    Question.name("The playing time of the National Anthem is 50 seconds", false),
    Question.name("The National Anthem was adopted in 1950", true),
    Question.name("The white color of our National flag represents Strength and courage of the country", false),
    Question.name("The Ashoka Chakra has 25 spokes", false),
    Question.name("The Constitution of India came to force on 26th January, 1950", true),
    Question.name("India has 6 Union Territories", false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Citizenship Test"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,

      ),
      backgroundColor: Colors.blueGrey,

      //we use a Builder here to use a context that is a descendent of Scaffold or else Scaffold.of() will throw an error
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("images/flag.jpg", height: 300, width: 200,)
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.5),
                    border: Border.all(
                      color: Colors.blueGrey.shade400, style: BorderStyle.solid
                    )
                  ),
                  height: 120.0,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[_currentIndex].questionText, style: TextStyle(
                      fontSize: 19.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic

                    ),),
                  )),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(onPressed: () => previousQuestion(), color: Colors.blueGrey.shade900,
                      child: Icon(Icons.arrow_back, color: Colors.white60,)
                  ),
                  RaisedButton(onPressed: () => checkAnswer(true, context), color: Colors.blueGrey.shade900,
                  child: Text("True", style: TextStyle(
                    color: Colors.white60, fontSize: 15.0
                  ),), ),
                  RaisedButton(onPressed: () => checkAnswer(false, context), color: Colors.blueGrey.shade900,
                    child: Text("False", style: TextStyle(
                        color: Colors.white60, fontSize: 15.0
                    ),), ),
                  RaisedButton(onPressed: () => nextQuestion(), color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_forward, color: Colors.white60,)
                  ),


                ],

              ),
              Spacer(),
            ],

          ),
        ),
      ),
    );
  }
  checkAnswer(bool choice, BuildContext context)
  {
    bool ans = questionBank[_currentIndex].isCorrect;
    if( ans == choice)
      {
        final snackbar = SnackBar(duration: Duration(milliseconds: 400),
            content: Text("Correct", style: TextStyle(
          fontSize: 17.0, fontWeight: FontWeight.w400, color: Colors.white70,
        ),)
        , backgroundColor: Colors.green);
        Scaffold.of(context).showSnackBar(snackbar);
        debugPrint('Correct!!');

      }
    else{
      final snackbar = SnackBar(duration: Duration(milliseconds: 400),
        content: Text("Incorrect!!", style: TextStyle(
          fontSize: 17.0, fontWeight: FontWeight.w400, color: Colors.white70,
      ),
      )
      ,backgroundColor: Colors.red,);

      Scaffold.of(context).showSnackBar(snackbar);
      debugPrint('Wrong');
    }
    nextQuestion();

  }

  void nextQuestion() {
    //debugPrint('CHECK');
    setState(() {
      _currentIndex = (_currentIndex + 1 )% questionBank.length;

    });
  }

  previousQuestion() {
    setState(() {
      if(_currentIndex == 0)
        {
          //do nothing
        }
      else{
        _currentIndex--;

      }
    });
  }
}
