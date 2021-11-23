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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          // 'Flulight',
          isOn.toString(),
          style: GoogleFonts.raleway(),
        ),
      ),
      body: _buildApp(),
    );
  }

  Widget _buildApp() {
    return Center(
      child: Switch(
        value: isOn,
        onChanged: (value) {
          setState(() {
            isOn = !isOn;
            isOn ? Flashlight.lightOn() : Flashlight.lightOff();
          });
        },
      ),
    );
  }
}
