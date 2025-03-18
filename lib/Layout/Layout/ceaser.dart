import 'package:flutter/material.dart';


class CaesarCipherApp extends StatefulWidget {
  @override
  _CaesarCipherAppState createState() => _CaesarCipherAppState();
}

class _CaesarCipherAppState extends State<CaesarCipherApp> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  int _shift = 3;
  String _resultencryption = '';
  String _resultdecryption = '';
  void _encrypt() {
    String plainText = _controller.text;
    String cipherText = '';
    for (int i = 0; i < plainText.length; i++) {
      String char = plainText[i];
      if (char.contains(RegExp(r'[A-Za-z]'))) {
        // Convert the character to its ASCII code
        int asciiCode = char.codeUnitAt(0);
        // Determine if the character is uppercase or lowercase
        if (char == char.toUpperCase()) {
          // Apply the shift to the ASCII code of the character, wrapping around if necessary
          int shiftedCode = (asciiCode - 65 + _shift) % 26 + 65;
          // Convert the shifted ASCII code back to a character
          char = String.fromCharCode(shiftedCode);
        } else {
          int shiftedCode = (asciiCode - 97 + _shift) % 26 + 97;
          char = String.fromCharCode(shiftedCode);
        }
      }
      // Append the encrypted character to the cipher text
      cipherText += char;
    }
    setState(() {
      _resultencryption = cipherText;
    });
  }
  void _Decrypt() {
    String cipherText = _controller2.text;
    String plainText = '';
    for (int i = 0; i < cipherText.length; i++) {
      String char = cipherText[i];
      if (char.contains(RegExp(r'[A-Za-z]'))) {
        int asciiCode = char.codeUnitAt(0);
        if (char == char.toUpperCase()) {
          int shiftedCode = (asciiCode - 65 - _shift) % 26 + 65;
          char = String.fromCharCode(shiftedCode);
        } else {
          int shiftedCode = (asciiCode - 97 - _shift) % 26 + 97;
          char = String.fromCharCode(shiftedCode);
        }
      }
      plainText += char;
    }
    setState(() {
      _resultdecryption  = plainText;
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
            Text(" Caesar Cipher ", style: TextStyle(color: Colors.red.shade900, fontSize: 25, fontFamily: "Quintessential",),),
            TextFormField(controller: _controller, decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.red.shade900),),focusedBorder: OutlineInputBorder( borderSide: BorderSide(width: 2.0, color: Colors.red.shade900), ),labelText: 'Enter a message to encrypt',),style: TextStyle(color: Colors.red.shade900,),),
            Row(children: [Text("       ")],),
            TextFormField(controller: _controller2, decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.red.shade900),),focusedBorder: OutlineInputBorder( borderSide: BorderSide(width: 2.0, color: Colors.red.shade900), ),labelText: 'Enter a message to Decrypt',),style: TextStyle(color: Colors.red.shade900,),),

            Row(
              children: [
                Text('Shift by: ',style: TextStyle(color: Colors.red.shade900,fontSize: 15),),
                //SizedBox(width: 16.0),
                DropdownButton<int>(
                  value: _shift,
                  items: List.generate(26, (i) => i + 1)
                      .map((i) => DropdownMenuItem(
                    value: i,
                    child: Text(i.toString()),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _shift = value!;
                    });
                  },
                ),
              ],
            ),
            //SizedBox(height: 16.0),
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
                    Text("Caesar Cipher was first used by the ancient Roman military commander Gaius Julius Caesar to transmit encrypted information in the army so it is called the Caesar cipher. This is a displacement encryption method Only 26 (upper and lower case) letters are displacement encrypted The rules are quite simple and easy to be cracked The following is a comparison of moving the plaintext alphabet back to 3 digits",style: TextStyle(color: Colors.black,fontSize: 16),),
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
