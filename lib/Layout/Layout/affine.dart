import 'package:flutter/material.dart';


class Affine extends StatefulWidget {
  @override
  Affineapp createState() => Affineapp();
}

class Affineapp extends State<Affine> {




  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  int keyA = 3;
  int keyB = 3;
  String _resultencryption = '';
  String _resultdecryption = '';



  void _encrypt() {
    String plainText = _controller.text;
    String cipherText = '';
    for (int i = 0; i < plainText.length; i++) {
      String char = plainText[i];
      if (char.contains(RegExp(r'[A-Za-z]'))) {
        int asciiCode = char.codeUnitAt(0);
        if (char == char.toUpperCase()) {
          int shiftedCode = ((keyA * (asciiCode - 65 ) + keyB) % 26) + 65;
          char = String.fromCharCode(shiftedCode);
        } else {
          int shiftedCode = ((keyA * (asciiCode - 97 ) + keyB) % 26) + 97;
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
    int inverseA = 0;

    for (int i = 0; i < 26; i++) {
      if ((keyA * i) % 26 == 1) {
        inverseA = i;
        break;
      }}

    for (int i = 0; i < cipherText.length; i++) {
      String char = cipherText[i];
      if (char.contains(RegExp(r'[A-Za-z]'))) {
        int asciiCode = char.codeUnitAt(0);
        if (char == char.toUpperCase()) {
          int shiftedCode = (( inverseA * (asciiCode - 65 - keyB + 26) % 26) + 65) as int;
          char = String.fromCharCode(shiftedCode);
        } else {
          int shiftedCode = ((inverseA * (asciiCode - 97 - keyB + 26) % 26) + 97) as int;
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
        children: [
         Padding(padding: EdgeInsets.all(10),
           child:InkWell(
              child:Container(
                //width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                child: Center(child:Column(
                  children: <Widget>[

                    Text(" Affine Cipher ", style: TextStyle(color: Colors.red.shade900, fontSize: 25, fontFamily: "Quintessential",),),
                    //ElevatedButton(onPressed: null, child: Text("C000000", style: TextStyle(color: Colors.red.shade900),),),

                      TextFormField(controller: _controller, decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.red.shade900),),focusedBorder: OutlineInputBorder( borderSide: BorderSide(width: 2.0, color: Colors.red.shade900), ),labelText: 'Enter a message to encrypt',),style: TextStyle(color: Colors.red.shade900,),),
                      Row(children: [Text("       ")],),
                      TextFormField(controller: _controller2, decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.red.shade900),),focusedBorder: OutlineInputBorder( borderSide: BorderSide(width: 2.0, color: Colors.red.shade900), ),labelText: 'Enter a message to Decrypt',),style: TextStyle(color: Colors.red.shade900,),),

                    Row(
                      children: [
                        Text('Parameter A: ',style: TextStyle(color: Colors.red.shade900,fontSize: 15),),
                        //SizedBox(width: 16.0),
                        DropdownButton<int>(
                          value: keyA,
                          items: List.generate(1000, (i) => i + 1)
                              .map((i) => DropdownMenuItem(
                            value: i,
                            child: Text(i.toString()),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              keyA = value!;
                            });
                          },
                        ),
                        Text('Parameter B: ',style: TextStyle(color: Colors.red.shade900,fontSize: 15),),
                        //SizedBox(width: 16.0),
                        DropdownButton<int>(
                          value: keyB,
                          items: List.generate(26, (i) => i + 1)
                              .map((i) => DropdownMenuItem(
                            value: i,
                            child: Text(i.toString()),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              keyB = value!;
                            });
                          },
                        ),
                      ],
                    ),



                      Row(children:[
                        Container(margin:EdgeInsets.all(10),child:Column(children:[ElevatedButton( onPressed: _encrypt, style:ElevatedButton.styleFrom(padding: EdgeInsets.all(10),backgroundColor:Colors.black ,side: BorderSide(color: Colors.red.shade900, width: 2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),)),child: Text("Encrypt",style: TextStyle(color: Colors.red.shade900,fontSize: 25 ),),),],),),
                        Container(margin: EdgeInsets.all(28),),
                        Container(margin:EdgeInsets.all(10),child:Column(children:[ElevatedButton(onPressed: _Decrypt, style:ElevatedButton.styleFrom(padding: EdgeInsets.all(10),backgroundColor:Colors.black ,side: BorderSide(color: Colors.red.shade900, width: 2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),)),child: Text("Decrypt",style: TextStyle(color: Colors.red.shade900,fontSize: 25 ),),),],),),
                    ]),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                                             //SizedBox(height: 10.0),
                        Text('Encrypt',style: TextStyle(color: Colors.red.shade900,fontSize: 20),),
                        TextField(enabled: false, decoration: InputDecoration(hintText: _resultencryption,),),
                                             //SizedBox(height: 8.0),
                        Text('Decrypt',style: TextStyle(color: Colors.red.shade900,fontSize: 20),),

                        TextField(enabled: false, decoration: InputDecoration(hintText: _resultdecryption,),),

                        Text("Description",style: TextStyle(color: Colors.red.shade900,fontSize: 21),),
                        Text("Affine cipher encryption process:  Convert each letter in the plain text alphabet to a corresponding integer in the range of 0 to m -1;   and  Calculate the value of each letter as follows (where a and b are the keys of the password): E(x)=(ax + b) mod m   Then  Multiply the integer value of the plain text letter by a, then add b to the result, and finally we take the modulus m (that is, take the remainder when m is removed, or remove the length of the letter until it is less than The length of the number).",style: TextStyle(color: Colors.black,fontSize: 16),)
                          ],
                                             ),
                                           ],

                                ),
                                ),
                         ),
                     ),
                 ),
                ],
              ),
              ),
    );

  }
}