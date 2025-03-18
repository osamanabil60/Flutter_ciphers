import 'package:flutter/material.dart';
import 'Layout/home_screan.dart';


void main() {
  runApp(MyApp());

}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,////علسان الشريط الاحمر اللي ف الزاويه يختفي
      title: "MY App : Dark theme !",
      home: Scaffold(
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
        body: Home_Screan(),
      ),
    );
  }
}




















/*import 'package:flutter/material.dart';
import 'Layout/home_screan.dart';


void main() {
  runApp(MyProjectApp());

}
class MyProjectApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     debugShowCheckedModeBanner: false, //علسان الشريط الاحمر اللي ف الزاويه يختفي
     title: "MY App : Dark theme !",
     home: Scaffold(
       appBar: AppBar(
         title: Text("The BatMan theme  ?",
           style: TextStyle(
             color: Colors.black,
             fontSize: 25,
             fontFamily: "Parisienne",
           ),
         ),
         backgroundColor: Colors.red.shade900,
       ),
       body: Home_Screan(),
     ),
   );
  }
}*/

