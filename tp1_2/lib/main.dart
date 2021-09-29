import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questions/Réponses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Questions/Réponses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Question {
  String question;
  bool answer;
  Question({required this.question, required this.answer});
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _score = 0;
  //bool _disabled = false;
  bool _answred = true;
  var questions = [
    Question(
        question: "Est-ce que cette planette est bien la planète Terre ?",
        answer: true),
    Question(
        question: "La planète Terre est la plus proche planète au Soleil",
        answer: false),
    Question(
        question:
            "La planète Terre est la plus grande planète du système solaire",
        answer: false),
    Question(
        question:
            "L'étoile Sirius de la Constellation du Grand Chien est l'étoile la plus brillante vue de Terre",
        answer: true),
    Question(
        question:
            "Les océans et les mers ne forment que le un tier de la planète Terre",
        answer: false),
    Question(
        question: "Vénus est la planète la plus proche à la planète Terre",
        answer: true)
  ];
  void _next() {
    setState(() {
      //passer a la question d'après
      // suprimer le format des bouttons (couleur)

      if (_counter == questions.length - 1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Bravo! Votre score est : $_score / ${questions.length} .\n Recommencez!"),
        ));
        _counter = 0;
        _score = 0;
      } else {
        _counter++;
      }
      _answred = !_answred;
    });
  }

  void _check(bool answer, BuildContext context) {
    setState(() {
      _answred = !_answred;
      if (answer == questions[_counter].answer) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Bonne réponse !"),
        ));
        _score++;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Oups, raté !"),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color color = Colors.deepPurple;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 20,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple[100],
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    'Question ${_counter + 1} ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )),
            Positioned(
              top: 55,
              child: Container(
                width: MediaQuery.of(context).size.width / 10 * 9,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/9/97/The_Earth_seen_from_Apollo_17.jpg'),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 3,
                    ),
                    shape: BoxShape.rectangle),
              ),
            ),
            Positioned(
              top: 350,
              width: MediaQuery.of(context).size.width / 10 * 9,
              height: 150,
              child: Container(
                alignment: Alignment.center,
                //color: Colors.deepPurple[100],
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 3,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${questions[_counter].question} ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Positioned(
                top: 540,
                width: MediaQuery.of(context).size.width / 10 * 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Column contents vertically
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () =>
                          !_answred ? null : _check(true, this.context),
                      child: Column(
                        children: [
                          Icon(Icons.thumb_up, color: Colors.deepPurple),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Text(
                              'Vrai',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () =>
                          !_answred ? null : _check(false, this.context),
                      child: Column(
                        children: [
                          Icon(Icons.thumb_down, color: Colors.deepPurple),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            color: Colors.white,
                            child: Text(
                              'Faux',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
        // ],
        //),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _next,
        tooltip: 'Next',
        child: const Icon(Icons.arrow_forward),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
