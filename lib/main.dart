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
  var showStatus = 'Light is off';

  void toggle() {
    if (isOn) {
      setState(() {
        showStatus = 'Light is off';
        isOn = false;
      });
      Flashlight.lightOn();
    } else {
      setState(() {
        showStatus = 'Light is on';
        isOn = true;
      });
      Flashlight.lightOff();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _new(),
    );
  }

  Widget _new() {
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text(
                    '$showStatus',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                    child: Container(
                      decoration: isOn
                          ? BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(0, 175, 161, 1),
                                  Color.fromRGBO(102, 208, 255, 1),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.9),
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            )
                          : BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                      child: Icon(
                        Icons.power_settings_new,
                        color: Colors.white,
                        size: 35,
                      ),
                      height: 90,
                      width: 90,
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Flulight',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Simple flashlight controller',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'flulight.blackiq.ir',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApp() {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.scale(
              scale: 3,
              child: Switch(
                value: isOn,
                activeColor: Colors.yellow,
                onChanged: (value) {
                  setState(() {
                    if (isOn) {
                      isOn = !isOn;
                      Flashlight.lightOff();
                    } else {
                      isOn = !isOn;
                      Flashlight.lightOn();
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
