import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FirstCard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomeCardPage(title: 'FirstCard'),
    );
  }
}

class MyHomeCardPage extends StatefulWidget {
  const MyHomeCardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomeCardPage> createState() => _MyHomeCardPageState();
}

class _MyHomeCardPageState extends State<MyHomeCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.indigo[500],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: const Text(
                    //padding:
                    "Mother EARTH  \n motherearth@world.ww \n IG: @Earth__",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                )),
            Positioned(
              top: -55,
              //elevation: 1.0,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                    //color: const Color(0xff7c94b6),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/9/97/The_Earth_seen_from_Apollo_17.jpg'),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(
                      color: Colors.indigo,
                      width: 3,
                    ),
                    shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
