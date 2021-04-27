 import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class bmiapp extends StatefulWidget {
  @override
  _bmiappState createState() => _bmiappState();
}

class _bmiappState extends State<bmiapp> {
  final TextEditingController _age= new TextEditingController();
  final TextEditingController _weight= new TextEditingController();
  final TextEditingController _height= new TextEditingController();
  String fresult="";
  String condition="";

  void calculateBmi(){
   setState(() {
     if(_age.text.isEmpty|| _weight.text.isEmpty||_height.text.isEmpty){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter all data")));
       fresult="";
       condition="";

     }
     else{
       int age= int.parse(_age.text);
       double weight= double.parse(_weight.text);
       double pound=weight*2.20462;
       double height= double.parse(_height.text);
       double inch= height*12;

       double result= 703*pound/(inch*inch);
       fresult="Your BMI is ${result.toStringAsFixed( 2)}";
       if(result<18.5){
         condition="Under weight";
       }
       else if(result>=18.5 && result<=24.9){
         condition="Normal weight";

       }
       else if (result>=25 && result<=29.9){
         condition="Over Weight";
       }
       else if(result>30){
         condition="Obesity";
       }

     }

   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text("Body Mass Index"),
        centerTitle: true,
      ),
      body: new Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
            "images/BMI.png",width: 100,height: 100,),
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: new Container(
               alignment: Alignment.center,
               decoration: BoxDecoration(
                 color: Colors.blueGrey.shade200,
                 borderRadius: BorderRadius.circular(20),
               ),
                 width: 245.0,
                 height: 245.0,
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextField(
                       controller:_age,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         labelText:( "Enter Your age"),
                         hintText:("e.g.14") ,
                         icon: new Icon(Icons.person,color: Colors.orange),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextField(
                       controller: _height,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         labelText:( " Enter Your Height in Feet"),
                         hintText:("e.g.5.3") ,
                         icon: new Icon(Icons.accessibility,color: Colors.pink,),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextField(
                       controller: _weight,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         labelText:( " Enter Your Weight in Kg"),
                         hintText:("e.g.40 ") ,
                         icon: new Icon(Icons.wc,color: Colors.green,),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
            Container(
              child: Column(
                children: [
                  RaisedButton(onPressed: calculateBmi,
                    child: Text("Calculate"),
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$fresult",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20.1),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$condition ",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20.1,),),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
