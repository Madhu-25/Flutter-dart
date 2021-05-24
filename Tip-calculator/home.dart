


import 'package:first_app/UI/util/hexcolor.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



class BillSplitter extends StatefulWidget {
  const BillSplitter({Key key}) : super(key: key);

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int tipPercentage = 0;
  int personCounter = 1;
  double billAmount = 0.0;
  
  Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView( //allows us to scroll the screen when the keyboard pops up
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              //margin: EdgeInsets.only(top: 120.0),
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),   //gets the height of screen on any device and places the container, so the position of it will be the same in all devices
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total per person", style: TextStyle(
                      fontSize:  20.0,
                      fontWeight: FontWeight.normal,
                      color: _purple,
                    ),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" \$${calculateTotalPerPerson(billAmount, personCounter, tipPercentage)}", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34.9,
                        color: _purple
                      ),),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 250,
              width: 350,
              margin: EdgeInsets.only(top: 70.0) ,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Column(

                children: [
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color : _purple),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money)
                    ),
                    onChanged: (String value){
                      try{
                        billAmount = double.parse(value);


                      }
                      catch(exception)
                      {
                        billAmount = 0.0;

                      }
                    },
                  ),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("Split", style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0
                      )),
                      Row(
                        children: [
                          InkWell(
                            onTap: ()
                            {
                              setState(() {
                                if(personCounter > 1)
                                  {
                                    personCounter--;
                                  }
                                else{
                                  //do nothing
                                }
                              });

                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular((7.0))
                                    ,
                                color: _purple.withOpacity(0.12)
                              ),
                              child: Center(
                                child: Text("-", style: TextStyle(
                                  color: _purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                                ),),
                              ),
                            ),
                          ),
                          Text("$personCounter" , style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: _purple
                          ),),
                          InkWell(
                            onTap: ()
                            {
                              setState(() {
                                personCounter++;
                              });

                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular((7.0))
                                  ,
                                  color: _purple.withOpacity(0.12)
                              ),
                              child: Center(
                                child: Text("+", style: TextStyle(
                                    color: _purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0
                                ),),
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tip", style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0

                      ),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("\$${calculateTotalTip(billAmount, personCounter, tipPercentage).toStringAsFixed(2)}", style: TextStyle(
                          color: _purple,
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,

                        ),),
                      )
                    ],
                  ),
                  //Slider
                  Column(
                    children: [
                      Text("$tipPercentage %", style: TextStyle(
                        color: _purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                      ),),
                      Slider(min: 0, max: 100, activeColor : _purple, inactiveColor: Colors.grey,
                          //divisions: 5,
                          value: tipPercentage.toDouble(), onChanged: (double newValue)
                      {
                        setState(() {
                          tipPercentage = newValue.round();
                        });
                      })
                    ],
                  )

                ],
              ),
            )
          ],


        ),
      ),
    );
  }

  calculateTotalPerPerson( double billAmount, int splitBy, int tipPercentage)
  {
    double totalPerPerson = (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) / splitBy;
    return totalPerPerson.toStringAsFixed(2);

  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage)
  {
    double totalTip = 0.0;
    if(billAmount < 0 || billAmount.toString().isEmpty || billAmount == null)
      {
        // nothing
      }
    else{
      totalTip = (billAmount * tipPercentage) /100;


    }
    return totalTip;
  }
}


