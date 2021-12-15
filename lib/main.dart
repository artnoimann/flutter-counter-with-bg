import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'IndieFlower'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/wal.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tap "-" to decrement',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                CounterWidget(),
                Text(
                  'Tap "+" to increment',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _counter;

  @override
  void initState() {
    _counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100 + _counter.toString().length * 10,
      //margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _counter--;
              });
            },
            icon: Icon(Icons.remove),
          ),
          Text(
            '$_counter',
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
