import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }

}

class BmiState extends State<Home> {

  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();

  double inches = 0.0;
  double result = 0.0;
  String weightans = "";

  void _calculateBmi()
  {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12;
      double weight = double.parse(_weightController.text);

      /*Underweight: BMI is less than 18.5
Normal weight: BMI is 18.5 to 24.9
Overweight: BMI is 25 to 29.9
Obese: BMI is 30 or more*/
      if((_ageController.text.isNotEmpty ||age > 0)&&
        (_weightController.text.isNotEmpty || weight >0)&&
        (_heightController.text.isNotEmpty || inches > 0))
        {
           result =  weight/(inches*inches)*703;
           if(result < 18.5)
             {
               weightans = "Under Weight";
             }
             else if(result >=18.5 && result<24.9)
               {
                 weightans = "Normal Weight";
               }
             else if(result >=25 && result<29.9)
               {
                 weightans = "Over Weight";
               }
             else if(result >=30 )
               {
                 weightans = "Obese";
               }


        }
        else
          {
            result = 0.0;
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("BMI",
          style: new TextStyle(
            color: Colors.white,
          ),),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ), //end of appbar

      body: new Container(
        alignment: Alignment.center,

        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/bmi.png', width: 200.0, height: 90.0,),

            new Container(
              margin: const EdgeInsets.all(3.0),
              height: 250,
              width: 1200,
              color: Colors.blueGrey.shade100,
              child: new Column(

                children: <Widget>[
                  new TextField(
                    controller: _ageController, //age Controller
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Age",
                      hintText: "Enter your Age",
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new TextField(
                    controller: _heightController, //Height Controller
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Height in Feets",
                      hintText: "Enter your Height",
                      icon: new Icon(Icons.adjust),
                    ),
                  ),
                  new TextField(
                    controller: _weightController, //Weight Controller
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Weight in lbs",
                      hintText: "Enter Your Weight",
                      icon: new Icon(Icons.view_headline),
                    ),
                  ),
                  
                  Padding(padding: const EdgeInsets.all(10.0)),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(left: 130.0),
                          child :new RaisedButton(onPressed:_calculateBmi,
                          color: Colors.pinkAccent,
                          child: new Text("Calculate",
                            style: new TextStyle(color: Colors.white,fontSize: 13.9,fontWeight: FontWeight.w900),),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),


          Padding(padding: const EdgeInsets.all(20.0)),
          new Center(
              child:new Column(
             children: <Widget>[
              new Text("Your BMI: $result",
                style: new TextStyle(
                  color:Colors.blueAccent,
                  fontSize: 20.0,
                ),
              ),
             ],

              )),

            Padding(padding: const EdgeInsets.all(20.0)),
            new Center(
                child:new Column(
                  children: <Widget>[
                    new Text("Weight:$weightans",
                      style: new TextStyle(
                        color:Colors.pinkAccent,
                        fontSize: 20.0,
                      ),
                    ),
                  ],

                )),
          ], //end of listview children
        ),
      ), //end of body container
      //new Image.asset('')
    ); //ending of scaffold
  }

}