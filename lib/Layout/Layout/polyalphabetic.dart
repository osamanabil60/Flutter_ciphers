import 'package:flutter/material.dart';

class Polyalphabetic extends StatefulWidget {
  @override
  PolyalphabeticApp createState() =>  PolyalphabeticApp();
}

class  PolyalphabeticApp extends State<Polyalphabetic> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  String _resultencryption = '';
  String _resultdecryption = '';


  void _encrypt() {
    String plainText = _controller.text;
    String cipherText = '';

    int _shiftF = 3;
    int _shiftS = 2;
    int _shiftTh = 4;
    String cipherText2 = '';
    String cipherText3 = '';
    for (int i = 0 ; i < plainText.length; i++) {
      String char = plainText[i];
      if (char.contains(RegExp(r'[A-Za-z]'))  ) {
        int asciiCode = char.codeUnitAt(0);
        if (char == char.toUpperCase() ) {int shiftedCode = (asciiCode - 65 + _shiftF) % 26 + 65;char = String.fromCharCode(shiftedCode) ;}
        else {int shiftedCode = (asciiCode - 97 + _shiftF) % 26 + 97;char = String.fromCharCode(shiftedCode) ;}
      }
      cipherText += char;
    }

    for (int i = 0 ; i < plainText.length; i++) {
      String char = cipherText[i];
      if (char.contains(RegExp(r'[A-Za-z]'))  ) {
        int asciiCode = char.codeUnitAt(0);
        if (char == char.toUpperCase() ) {int shiftedCode = (asciiCode - 65 + _shiftS) % 26 + 65;char = String.fromCharCode(shiftedCode) ;}
        else {int shiftedCode = (asciiCode - 97 + _shiftS) % 26 + 97;char = String.fromCharCode(shiftedCode) ;}
      }
      cipherText2 += char;
    }

    for (int i = 0 ; i < plainText.length; i++) {
      String char = cipherText[i];
      if (char.contains(RegExp(r'[A-Za-z]'))  ) {
        int asciiCode = char.codeUnitAt(0);
        if (char == char.toUpperCase() ) {int shiftedCode = (asciiCode - 65 + _shiftTh) % 26 + 65;char = String.fromCharCode(shiftedCode) ;}
        else {int shiftedCode = (asciiCode - 97 + _shiftTh) % 26 + 97;char = String.fromCharCode(shiftedCode) ;}
      }
      cipherText3 += char;}
    String result = "";

    for (int i = 0; i < cipherText.length; i += 3) {
      result += cipherText[i];
      if (i + 1 < cipherText2.length) {result += cipherText2[i + 1];}
      if (i + 2 < cipherText3.length) {result += cipherText3[i + 2];}
    }
    setState(() {_resultencryption = result;});
  }



  void _Decrypt() {
    String cipherText = _controller2.text;
    String plainText = '';
    int RshiftF = -3;
    int RshiftS = -2;
    int RshiftTh = -4;

    String plainText1 = '';
    String plainText2 = '';
    String plainText3 = '';
    for (int i = 0 ; i < cipherText.length; i++) {
      String char = cipherText[i];
      if (char.contains(RegExp(r'[A-Za-z]'))  ) {
        int asciiCode = char.codeUnitAt(0);
        if (char == char.toUpperCase() ) {int shiftedCode = (asciiCode - 65 + RshiftF) % 26 + 65;char = String.fromCharCode(shiftedCode) ;}
        else {int shiftedCode = (asciiCode - 97 + RshiftF) % 26 + 97;char = String.fromCharCode(shiftedCode) ;}
      }
      plainText1 += char;
    }
    for (int i = 0 ; i < cipherText.length; i++) {
      String char = plainText1[i];
      if (char.contains(RegExp(r'[A-Za-z]'))  ) {
        int asciiCode = char.codeUnitAt(0);
        if (char == char.toUpperCase() ) {int shiftedCode = (asciiCode - 65 + RshiftS) % 26 + 65;char = String.fromCharCode(shiftedCode) ;}
        else {int shiftedCode = (asciiCode - 97 + RshiftS) % 26 + 97;char = String.fromCharCode(shiftedCode) ;}
      }
      plainText2 += char;
    }
    for (int i = 0 ; i < cipherText.length; i++) {
      String char = plainText1[i];
      if (char.contains(RegExp(r'[A-Za-z]'))  ) {
        int asciiCode = char.codeUnitAt(0);
        if (char == char.toUpperCase() ) {int shiftedCode = (asciiCode - 65 + RshiftTh) % 26 + 65;char = String.fromCharCode(shiftedCode) ;}
        else {int shiftedCode = (asciiCode - 97 + RshiftTh) % 26 + 97;char = String.fromCharCode(shiftedCode) ;}
      }
      plainText3 += char;
    }
    String resultd = "";
    for (int i = 0; i < plainText1.length; i += 3) {
      resultd += plainText1[i];
      if (i + 1 < plainText2.length) {resultd += plainText2[i + 1];}
      if (i + 2 < plainText3.length) {resultd += plainText3[i + 2];}
    }
    setState(() {
      _resultdecryption  = resultd;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The CodeWord !",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontFamily: "Mea Culpa",

          ),
        ),
        backgroundColor: Colors.red.shade900,
        centerTitle: true,
      ),
      body:Container(child: ListView(
          scrollDirection: Axis.vertical,
          children: [Padding(padding: EdgeInsets.all(10),child:InkWell(
            child:Container(
              color: Colors.white,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(" Polyalphabetic Cipher ", style: TextStyle(color: Colors.red.shade900, fontSize: 25, fontFamily: "Quintessential",),),
                  TextFormField(controller: _controller, decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.red.shade900),),focusedBorder: OutlineInputBorder( borderSide: BorderSide(width: 2.0, color: Colors.red.shade900), ),labelText: 'Enter a message to encrypt',),style: TextStyle(color: Colors.red.shade900,),),
                  Row(children: [Text("       ")],),
                  TextFormField(controller: _controller2, decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.red.shade900),),focusedBorder: OutlineInputBorder( borderSide: BorderSide(width: 2.0, color: Colors.red.shade900), ),labelText: 'Enter a message to Decrypt',),style: TextStyle(color: Colors.red.shade900,),),

                  Row(children: [

                    Container(margin:EdgeInsets.all(10),child:Column(children:[ElevatedButton( onPressed: _encrypt, style:ElevatedButton.styleFrom(padding: EdgeInsets.all(10),backgroundColor:Colors.black ,side: BorderSide(color: Colors.red.shade900, width: 2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),)),child: Text("Encrypt",style: TextStyle(color: Colors.red.shade900,fontSize: 25 ),),),],),),
                    Container(margin: EdgeInsets.all(28),),
                    Container(margin:EdgeInsets.all(10),child:Column(children:[ElevatedButton(onPressed: _Decrypt, style:ElevatedButton.styleFrom(padding: EdgeInsets.all(10),backgroundColor:Colors.black ,side: BorderSide(color: Colors.red.shade900, width: 2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),)),child: Text("Decrypt",style: TextStyle(color: Colors.red.shade900,fontSize: 25 ),),),],),),
                  ],),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //SizedBox(height: 10.0),
                      Text('Encrypt',style: TextStyle(color: Colors.red.shade900,fontSize: 20),),
                      TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: _resultencryption,
                        ),
                      ),
                      //SizedBox(height: 8.0),
                      Text('Decrypt',style: TextStyle(color: Colors.red.shade900,fontSize: 20),),
                      SingleChildScrollView(child:Column(
                        children: [
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: _resultdecryption,
                            ),
                          ),
                          Text("Description",style: TextStyle(color: Colors.red.shade900,fontSize: 21),),
                          Text("polyalphabetic cipher is any cipher based on substitution, using multiple substitution alphabets &polyalphabetic cipher techniques have the following features in common: & A set of related monoalphabetic substitution rules is used. & A key determines which particular rule is chosen for a given transformation. Then We set the Key as Rules: 1) Shift the first letter three positions to the right 2) Shift the second letter five positions to the right 3) Shift the third letter seven positions to the right",style: TextStyle(color: Colors.black,fontSize: 16),)                        ],
                      )
                      ),
                    ],
                  )
                ],
              ),

            ),
          ),
          ),]),
      ),
    );

  }
}
