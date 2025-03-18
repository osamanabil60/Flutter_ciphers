import 'package:flutter/material.dart';
import 'dart:math';



class VigenereApp extends StatefulWidget {
  @override
  Vigenere createState() => Vigenere();
}

class Vigenere extends State<VigenereApp> {
  final TextEditingController _plaintextController = TextEditingController();
  final TextEditingController _plaintextController2 = TextEditingController();
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _ciphertextController = TextEditingController();
  final TextEditingController _decryptedTextController = TextEditingController();

  static const _alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  void _encrypt() {
    var plaintext = _plaintextController.text;
    var key = _keyController.text;

    var ciphertext = '';
    var keyIndex = 0;
    for (var i = 0; i < plaintext.length; i++) {
      var charIndex = _alphabet.indexOf(plaintext[i].toUpperCase());
      if (charIndex != -1) {
        var keyCharIndex = _alphabet.indexOf(key[keyIndex].toUpperCase());
        var encryptedCharIndex = (charIndex + keyCharIndex) % _alphabet.length;
        var encryptedChar = _alphabet[encryptedCharIndex];
        ciphertext += encryptedChar;
        keyIndex = (keyIndex + 1) % key.length;
      } else {
        ciphertext += plaintext[i];
      }
    }

    setState(() {
      _ciphertextController.text = ciphertext;
    });
  }

  void _decrypt() {
    var ciphertext = _plaintextController2.text;
    var key = _keyController.text;

    var plaintext = '';
    var keyIndex = 0;
    for (var i = 0; i < ciphertext.length; i++) {
      var charIndex = _alphabet.indexOf(ciphertext[i].toUpperCase());
      if (charIndex != -1) {
        var keyCharIndex = _alphabet.indexOf(key[keyIndex].toUpperCase());
        var decryptedCharIndex = (charIndex - keyCharIndex) % _alphabet.length;
        if (decryptedCharIndex < 0) {
          decryptedCharIndex += _alphabet.length;
        }
        var decryptedChar = _alphabet[decryptedCharIndex];
        plaintext += decryptedChar;
        keyIndex = (keyIndex + 1) % key.length;
      } else {
        plaintext += ciphertext[i];
      }
    }

    setState(() {
      _decryptedTextController.text = plaintext;
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
            Text(" Vigenere Cipher ", style: TextStyle(color: Colors.red.shade900, fontSize: 25, fontFamily: "Quintessential",),),
            TextFormField(controller: _plaintextController, decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.red.shade900),),focusedBorder: OutlineInputBorder( borderSide: BorderSide(width: 2.0, color: Colors.red.shade900), ),labelText: 'Enter a message to encrypt',),style: TextStyle(color: Colors.red.shade900,),),
            Row(children: [Text("       ")],),
            TextFormField(controller: _plaintextController2, decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.red.shade900),),focusedBorder: OutlineInputBorder( borderSide: BorderSide(width: 2.0, color: Colors.red.shade900), ),labelText: 'Enter a message to Decrypt',),style: TextStyle(color: Colors.red.shade900,),),
            Row(children: [Text("       ")],),
            TextFormField(controller: _keyController, decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.red.shade900),),focusedBorder: OutlineInputBorder( borderSide: BorderSide(width: 2.0, color: Colors.red.shade900), ),labelText: 'Enter Key ',),style: TextStyle(color: Colors.red.shade900,),),

            //SizedBox(height: 16.0),
            Row(children: [

              Container(margin:EdgeInsets.all(10),child:Column(children:[ElevatedButton( onPressed: _encrypt, style:ElevatedButton.styleFrom(padding: EdgeInsets.all(10),backgroundColor:Colors.black ,side: BorderSide(color: Colors.red.shade900, width: 2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),)),child: Text("Encrypt",style: TextStyle(color: Colors.red.shade900,fontSize: 25 ),),),],),),
              Container(margin: EdgeInsets.all(28),),
              Container(margin:EdgeInsets.all(10),child:Column(children:[ElevatedButton(onPressed: _decrypt, style:ElevatedButton.styleFrom(padding: EdgeInsets.all(10),backgroundColor:Colors.black ,side: BorderSide(color: Colors.red.shade900, width: 2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),)),child: Text("Decrypt",style: TextStyle(color: Colors.red.shade900,fontSize: 25 ),),),],),),
            ],),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //SizedBox(height: 10.0),
                Text('Encrypt',style: TextStyle(color: Colors.red.shade900,fontSize: 20),),
                TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: _ciphertextController.text,
                  ),
                ),
                //SizedBox(height: 8.0),
                Text('Decrypt',style: TextStyle(color: Colors.red.shade900,fontSize: 20),),
                SingleChildScrollView(child:Column(
                  children: [
                    TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: _decryptedTextController.text,
                      ),
                    ),
                    Text("Description",style: TextStyle(color: Colors.red.shade900,fontSize: 21),),
                    Text("Vigenere cipher, each letter of the plaintext is shifted by a different amount depending on its position in the keyword. For example, if the keyword is LEMON and the plaintext is HELLO, the first letter of the plaintext is shifted by L, the second letter is shifted by E, the third letter is shifted by M, and so on. Once the end of the keyword is reached, the process repeats from the beginning of the keyword.",style: TextStyle(color: Colors.black,fontSize: 16),),
                  ],
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
