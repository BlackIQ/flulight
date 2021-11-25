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
  var imageLink = 'https://wallpapercave.com/wp/wp4186729.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      imageLink = 'https://wallpapercave.com/wp/wp4186729.jpg';
                      Flashlight.lightOff();
                    }
                    else {
                      isOn = !isOn;
                      imageLink = 'https://wallpapercave.com/wp/wp4186712.jpg';
                      Flashlight.lightOn();
                    }
                  });
                },
              ),
            ),
            SizedBox(height: 30),
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
          ],
        ),
      ),
    );
  }
}
