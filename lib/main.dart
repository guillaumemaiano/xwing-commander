import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:xwingcommander/star_wars_free_icons_icons.dart';
import 'star_wars_free_icons_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Should be a private class (or whatever it is in Dart) that decides whether we're Rebels or Empire
    // In order to control whether colors are Black/Red or White/Blue, and Icons/Images.
    // appScheme.main
    // appScheme.primary
    // appScheme.secondary
    // appScheme.icon etc
    final Color appScheme = Colors.black;

    // FlutterStatusbarcolor.setStatusBarColor(appScheme);

    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage(
                      'https://starwarsblog.starwars.com/wp-content/uploads/2016/02/il_fullxfull.769667001_sdf0.jpg'),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(StarWarsFreeIcons.star_wars_storm_trooper, color: Colors.blue,),
                Text(
                  'Systems access',
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  'Granted', // Granted / Refused / Offline
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Raleway',
                      fontSize: 18,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ), // General Status
            SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.lightBlueAccent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    // I need to learn how to extract subassemblies before this becomes unwieldly
                    <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Hangar lighting',
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Raleway',
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Cockpit lights',
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Raleway',
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Engines',
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Raleway',
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Droid Feed',
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Raleway',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ), // Column of Systems displayed
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'ON', // ON / OFF
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontFamily: 'Raleway',
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 30),
                      // Each column contains a 30-sized boxw to separate the hangar from the x-wing systems
                      Text(
                        'OFF', // ON / OFF
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'OFF', // ON / OFF
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'OFF', // ON / OFF
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ), // Column of status displayed relative to the system in previous column
                  // Yes, indeed, this should not be hand-built
                ],
              ), // Systems Status Display
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    )
        // https://dev.to/mightytechno/render-svg-in-flutter-app-4kan
// https://vignette.wikia.nocookie.net/starwars/images/e/ea/Resistance_starbird.svg/ // revision/latest/scale-to-width-down/118?cb=20150913201739
        );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
