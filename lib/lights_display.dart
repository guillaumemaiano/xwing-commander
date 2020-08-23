import 'package:flutter/material.dart';
class LightsDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LightsDisplayState();
}

class _LightsDisplayState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Row(
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
            // Each column contains a 30-sized box to separate the hangar from the x-wing systems
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
    ); // Systems Status Display
  }
}