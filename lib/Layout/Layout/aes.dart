import 'package:encrypt/encrypt.dart' ;
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;


class AesCipherExample extends StatefulWidget {
  @override
  _AesCipherExampleState createState() => _AesCipherExampleState();
}

class _AesCipherExampleState extends State<AesCipherExample> {
  // Define a 32-byte encryption key
  final _key = encrypt.Key.fromLength(32);

  // Generate a random initialization vector
  final _iv = IV.fromSecureRandom(16);

  // Define a text controller to get the user input
  final _textController = TextEditingController();
  final _textController2 = TextEditingController();

  // Define a variable to store the encrypted message
  String _encryptedMessage = '';

  // Define a variable to store the decrypted message
  String _decryptedMessage = '';

  late Encrypter _encrypter;

  _AesCipherExampleState() {
    // Create an instance of AES cipher with CBC mode and PKCS7 padding
    _encrypter = Encrypter(AES(_key, mode: AESMode.cbc, padding: 'PKCS7'));
  }

  // Define a function to encrypt the message
  void _encryptMessage() {
    final message = _textController.text;
    final encrypted = _encrypter.encrypt(message, iv: _iv);
    setState(() {
      _encryptedMessage = encrypted.base64;
    });
  }

  // Define a function to decrypt the message
  void _decryptMessage() {
 //   final encryptedMessage = Encrypted.fromBase64(_encryptedMessage);
    final encryptedMessage = Encrypted.fromBase64(_textController2.text);
    final decrypted = _encrypter.decrypt(encryptedMessage , iv: _iv);
    setState(() {
      _decryptedMessage = decrypted;
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
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   Text(" AES Cipher ", style: TextStyle(color: Colors.red.shade900, fontSize: 25, fontFamily: "Quintessential",),),
                   TextField(controller: _textController,decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.red.shade900),),focusedBorder: OutlineInputBorder( borderSide: BorderSide(width: 2.0, color: Colors.red.shade900), ),labelText: 'Enter a message to encrypt',),style: TextStyle(color: Colors.red.shade900,),),
                   Row(children: [Text("       ")],),
                   TextFormField(controller: _textController2, decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.red.shade900),),focusedBorder: OutlineInputBorder( borderSide: BorderSide(width: 2.0, color: Colors.red.shade900), ),labelText: 'Enter a message to Decrypt',),style: TextStyle(color: Colors.red.shade900,),),

                   Row(children: [

                     Container(margin:EdgeInsets.all(10),child:Column(children:[ElevatedButton( onPressed: _encryptMessage, style:ElevatedButton.styleFrom(padding: EdgeInsets.all(10),backgroundColor:Colors.black ,side: BorderSide(color: Colors.red.shade900, width: 2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),)),child: Text("Encrypt",style: TextStyle(color: Colors.red.shade900,fontSize: 25 ),),),],),),
                     Container(margin: EdgeInsets.all(28),),
                     Container(margin:EdgeInsets.all(10),child:Column(children:[ElevatedButton(onPressed: _decryptMessage, style:ElevatedButton.styleFrom(padding: EdgeInsets.all(10),backgroundColor:Colors.black ,side: BorderSide(color: Colors.red.shade900, width: 2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),)),child: Text("Decrypt",style: TextStyle(color: Colors.red.shade900,fontSize: 25 ),),),],),),
                   ],),



               Text('Encrypt',style: TextStyle(color: Colors.red.shade900,fontSize: 20),),
               TextField(
                 enabled: false,
                 decoration: InputDecoration(
                   hintText: _encryptedMessage,
                 ),
               ),
               //SizedBox(height: 8.0),
               Text('Decrypt',style: TextStyle(color: Colors.red.shade900,fontSize: 20),),
               SingleChildScrollView(child:Column(
                 children: [
                   TextField(
                     enabled: false,
                     decoration: InputDecoration(
                       hintText: _decryptedMessage,
                     ),
                   ),
                   Text("Description",style: TextStyle(color: Colors.red.shade900,fontSize: 21),),
                   Text("AES (Advanced Encryption Standard) is a widely used symmetric encryption algorithm that is used to protect sensitive data by encrypting it before transmission or storage. AES is a block cipher, which means that it operates on fixed-size blocks of data, and it can encrypt and decrypt data using a shared secret key",style: TextStyle(color: Colors.black,fontSize: 16),),                        ]


               )
               ),
                 ],
               )
             ),
           ),
           ),
           ]),
    ),
    );

  }
}

