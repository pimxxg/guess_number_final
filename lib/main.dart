import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guess_number_v2/classguess.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _controller = TextEditingController();

  var game = Game();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Guess The Number',
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            //border: Border.all(width: 5.0, color: Colors.purple),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.5),
                offset: const Offset(3.0, 6.0),
                blurRadius: 7.0,
                spreadRadius: 5.0,
              )
            ],
          ),
          //alignment: Alignment.center,

          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/guess_logo.png',
                      height: 100.0,
                      alignment: Alignment.center,
                    ),
                    SizedBox(width: 9.0),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Guess',
                            style:
                                TextStyle(fontSize: 45.0, color: Colors.orange),
                          ),
                          Text(
                            'The Number',
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.orange),
                          ),
                        ])
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    border: OutlineInputBorder(),
                    hintText: 'ทายเลขตั้งแต่ 1 ถึง 100',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, top: 15.0),
                child: ElevatedButton(
                    child: Text(
                      'Guess',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    onPressed: () {
                      var input = _controller.text;
                      var guess = int.tryParse(input);

                      if (guess == null) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('RESULT'),
                                content: Text(
                                    "กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'))
                                ],
                              );
                            });
                      }
                      if (guess != null) {
                        var result = game.doGuess(guess);
                        var count = game.doCount;
                        if (result == 0) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('RESULT'),
                                  content: Text(
                                      "$guess ถูกต้อง ทายไปทั้งหมด $count ครั้ง"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
                        }
                        else if (guess != 0) {
                         if (result == 1) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('RESULT'),
                                  content:
                                  Text("$guess มากไป โปรดทายใหม่อีกครั้ง"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
                        } else if (result== -1) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('RESULT'),
                                  content:
                                  Text("$guess น้อยไป โปรดทายใหม่อีกครั้ง"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
                        }
                      }
                    }
                    }),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
