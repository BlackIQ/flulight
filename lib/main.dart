import 'package:flutter/material.dart';
import 'package:flutter_flashlight/flutter_flashlight.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flulator',
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(),
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isOn = false;
  var imageLink = '';

  void bgImage() {
    if (isOn) {
      setState(() {
        imageLink = "https://wallpapercave.com/wp/fY89wT0.jpg";
      });
    }
    else {
      setState(() {
        imageLink = "https://wallpapercave.com/wp/NddQhSb.jpg";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bgImage();
    return Scaffold(
      body: _buildApp(),
    );
  }

  Widget _buildApp() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageLink),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Switch(
          value: isOn,
          onChanged: (value) {
            setState(() {
              isOn = !isOn;
              isOn ? Flashlight.lightOn() : Flashlight.lightOff();
            });
          },
        ),
      ),
    );
  }
}
