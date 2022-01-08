import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/guess_logo.png',
                    height: 100.0,
                    alignment: Alignment.center,
                  ),
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' Guess ',
                          style:
                              TextStyle(fontSize: 45.0, color: Colors.orange),
                        ),
                        Text(
                          ' The Number',
                          style:
                              TextStyle(fontSize: 22.0, color: Colors.orange),
                        ),
                      ])
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(50),
                child: TextField(),
              ),
              ElevatedButton(
                child: Text(
                  'Guess',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          )),
        ),
      ),
    );
  }
}
