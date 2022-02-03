import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List ordine = [{
    "id":"1",
    "nomeProdotto": "Pizza Margherita",
    "costo": 5.00,
    "quantita":1
  },
    {
      "id":"3",
      "nomeProdotto": "Pizza Boscaiola",
      "costo": 6.50,
      "quantita":1
    },{
      "id":"487349",
      "nomeProdotto": "Pizza 4 Formaggi",
      "costo": 7.00,
      "quantita":5
    },
    {
      "id":"33",
      "nomeProdotto": "Pizza 4 Formaggi",
      "costo": 7.00,
      "quantita":6
    },
  ];

  Widget getRow(String name, double price, int quantity, int index){
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album),
            title: Text('Nome ${name}'),
            subtitle: Text('Prezzo ${price}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('-'),
                onPressed: () {
                  setState(() {
                    ordine[index]["quantita"]--;
                });},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: Text('${quantity}'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('+'),
                onPressed: () {
                  setState(() {
                    ordine[index]["quantita"]++;
                  });
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  //final List names = ["Mario","Giovanni","Claudio"];
  //print('We sent the verification link to ${elementi['email']}.');


  @override
  Widget build(BuildContext context) {


    /*List ordine1 = ["Margherita","Mozzarella e Pomodoro",4.50, 4];
    List ordine2 = ["Boscaiola","Mozzarella e Funghi",5, 3];
    List ordine3 = ["4 Formaggi","Fontina, Mozzarella, Gorgonzola e bufala",6,2];
    List ordine = [ordine1, ordine2, ordine3];*/

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: ordine.length,
            itemBuilder: (context, index){
          return Center(
            child: getRow(ordine[index]["nomeProdotto"], ordine[index]["costo"], ordine[index]["quantita"], index),
          );
        }),
      )
    );
  }
}
