import 'package:flutter/material.dart';
import 'Layout/ceaser.dart';
import 'Layout/affine.dart';
import 'Layout/polyalphabetic.dart';
import 'Layout/aes.dart';
import 'Layout/vigenere.dart';



CeaserCi(){}
// ignore: camel_case_types
class Home_Screan extends StatefulWidget {
  @override
  myHome_Screan createState() => myHome_Screan();
}

class myHome_Screan extends State<Home_Screan>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.black,
      child: Center(
        child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(40),
              child: Column(
              children:<Widget> [
                  //Expanded(// to  new line if line is full
                   Text(
                    " Chose The Cipher ",
                    style: TextStyle(
                      color: Colors.red.shade900,
                      fontSize: 30,
                      fontFamily: "Quintessential",
                    ),
                  ),Row(children: [Text("       ")],),Row(children: [Text("       ")],),

                ElevatedButton(onPressed:() { Navigator.push( context, MaterialPageRoute(builder: (context) => CaesarCipherApp()),);},style:ElevatedButton.styleFrom(padding: EdgeInsets.all(15),backgroundColor:Colors.black ,side: BorderSide(color: Colors.red.shade900, width: 2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),)),child: Text("Caesar Cipher",style: TextStyle(color: Colors.red.shade900,fontSize: 25 ),),),
                Row(children: [Text("       ")],),
                ElevatedButton(onPressed:() { Navigator.push( context, MaterialPageRoute(builder: (context) => Affine()),);},style:ElevatedButton.styleFrom(padding: EdgeInsets.all(15),backgroundColor:Colors.black ,side: BorderSide(color: Colors.red.shade900, width: 2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),)),child: Text("Affine Cipher",style: TextStyle(color: Colors.red.shade900,fontSize: 25 ),),),
                Row(children: [Text("       ")],),
                ElevatedButton(onPressed:() { Navigator.push( context, MaterialPageRoute(builder: (context) =>  Polyalphabetic()),);},style:ElevatedButton.styleFrom(padding: EdgeInsets.all(15),backgroundColor:Colors.black ,side: BorderSide(color: Colors.red.shade900, width: 2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),)),child: Text("Poly A Cipher",style: TextStyle(color: Colors.red.shade900,fontSize: 25 ),),),
                Row(children: [Text("       ")],),
                ElevatedButton(onPressed:() { Navigator.push( context, MaterialPageRoute(builder: (context) => AesCipherExample()),);},style:ElevatedButton.styleFrom(padding: EdgeInsets.all(15),backgroundColor:Colors.black ,side: BorderSide(color: Colors.red.shade900, width: 2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),)),child: Text("AES Cipher",style: TextStyle(color: Colors.red.shade900,fontSize: 25 ),),),
                Row(children: [Text("       ")],),
                ElevatedButton(onPressed:() { Navigator.push( context, MaterialPageRoute(builder: (context) => VigenereApp()),);},style:ElevatedButton.styleFrom(padding: EdgeInsets.all(15),backgroundColor:Colors.black ,side: BorderSide(color: Colors.red.shade900, width: 2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),)),child: Text("Vigenere Cipher",style: TextStyle(color: Colors.red.shade900,fontSize: 25 ),),),

              ],
                ),
            ),
            ),
        );
  }
}












/*import 'package:flutter/material.dart';

// ignore: camel_case_types
class Home_Screan extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.black,
      child: Center(
        child: Column(
            children: <Widget>[
            Row(
              children:<Widget> [
                Expanded( // to  new line if line is full
                  child: Text(
                    "           ????      I'am Vengeance         ???? ",
                    style: TextStyle(
                      color: Colors.red.shade900,
                      fontSize: 20,
                      fontFamily: "Quintessential",

                    ),
                  ),
                ),
              ],
            ),
              Row(
                children: <Widget>[
                  Expanded( // to  new line if line is full
                    child: Text(
                      "           ????      I'am The Batman      ???? ",
                      style: TextStyle(
                        color: Colors.red.shade900,
                        fontSize: 20,
                        fontFamily: "Quintessential",

                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child:MyImage()
              ),
              Expanded(
                  child:MyImage1()
              )
            ]
        )
      )
    );
  }
}

class MyImage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image = new AssetImage('images/bat.jpg') ;
    Image TheImg = new Image(image: image ,);
    return Container(
      child: TheImg,
    );
  }
}
class MyImage1 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image = new AssetImage('images/mbat.jpg') ;
    Image TheImg1 = new Image(image: image ,);
    return Container(
      child: TheImg1,
    );
  }
}*/