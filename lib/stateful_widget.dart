import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(FristClassForWidget());
}

class FristClassForWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //TODO: implement createState
    return _FristClassForWidgetState();
  }
}

class _FristClassForWidgetState extends State<FristClassForWidget> {
  late bool _loading;
  late double _progressValue;

  @override
  void initState() {
    _loading = false;
    _progressValue = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: AppBar(
          title: Text("Header bar akbar"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: _loading
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LinearProgressIndicator(value: _progressValue),
                Text(
                  '${_progressValue * 100.round()}%',
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
              ],
            )
                : Text(
              'Press button to dowload',
              style: TextStyle(color: Colors.white60, fontSize: 24),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          child: Icon(Icons.cloud_download),
        ),
      ),
    );
  }
  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2;
        if(_progressValue.toStringAsFixed(1) == '1.0'){
          _loading = false;
          t.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
