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
        // imageLink = "https://wallpapercave.com/wp/fY89wT0.jpg";
        // imageLink = "https://wallpapercave.com/wp/wp1910047.jpg";
        imageLink = "https://wallpapercave.com/wp/wp4186712.jpg";
        // imageLink = "https://wallpapercave.com/wp/wp3155834.jpg";
      });
    }
    else {
      setState(() {
        // imageLink = "https://wallpapercave.com/wp/NddQhSb.jpg";
        imageLink = "https://wallpapercave.com/wp/wp4186729.jpg";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bgImage();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flulight',
        ),
        // backgroundColor: ,
      ),
      body: _buildApp(),
    );
  }

  Widget _buildApp() {
    return Container(
      width: double.infinity,
      height: double.infinity,
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
