
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Solid Software'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RandomColor _randomColor = RandomColor();
  int bonus = 10;
  Color color ;
  String colorName = '';
@override
  void initState() {
  color =   Colors.white;
  colorName = getColorNameFromColor(color).getName.toLowerCase();
  super.initState();
  }
  void _incrementCounter() {
    //generating new random color
    Color tempVar = _randomColor.randomColor();
    //gettingColorName
    final cName = getColorNameFromColor(tempVar).getName.toLowerCase();
    //bonus if else
    if(cName.toLowerCase().contains("red"))
      bonus+=10;
    else if (cName.toLowerCase().contains("blue"))
      bonus+=5;
     setState(() {
      bonus = bonus;
      color = _randomColor.randomColor();
      colorName = cName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  SafeArea(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child:
                  Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: _incrementCounter,
            child:
            Padding(
                padding:
                EdgeInsets.all(25.0),
                child:
                Text( 'Hello Solid Software',)
            ),
          ),
        ],
      )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  Text(
                    "Currnt color: $colorName",
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Your Bonus is",
                        style:
                        TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " $bonus ",
                        style:
                        TextStyle(fontWeight: FontWeight.bold,fontSize: 40),
                      ),
                      Text(
                        "Points",
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
      ),
  // This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }
}
