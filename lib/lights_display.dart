import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LightsDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LightsDisplayState();
}

enum LightStatus { on, off }

class LightsDisplayBloc {
  LightStatus cockpitLightStatus = LightStatus.off;
  BehaviorSubject<LightStatus> _cockpitLightSubject;

  LightsDisplayBloc({this.cockpitLightStatus}) {
    _cockpitLightSubject =
        new BehaviorSubject<LightStatus>.seeded(this.cockpitLightStatus);
  }

  Stream<LightStatus> get cockpitLightStream => _cockpitLightSubject.stream;

  void dispose() {
    _cockpitLightSubject.close();
  }

  void activate() {
    cockpitLightStatus = cockpitLightStatus == LightStatus.off
        ? LightStatus.on
        : LightStatus.off;
    _cockpitLightSubject.sink.add(cockpitLightStatus);
  }
}

class _LightsDisplayState extends State<StatefulWidget> {
  String _hangar_light = "ON";
  LightsDisplayBloc _lightsDisplayBloc = new LightsDisplayBloc();

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
        ),
        // Column of Systems displayed
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // flat button + setState method example
            FlatButton(
                onPressed: _powerClicked,
                child: Text(
                  _hangar_light, // ON / OFF
                  style: TextStyle(
                    color: _hangar_light == "OFF" ? Colors.redAccent : Colors.greenAccent,
                    fontFamily: 'Raleway',
                    fontSize: 16,
                  ),
                )),
            SizedBox(height: 30),
            // Each column contains a 30-sized box to separate the hangar from the x-wing systems
            // RX DART example (containing a flatbutton)
            new StreamBuilder(
                stream: _lightsDisplayBloc.cockpitLightStream,
                // truly, this should wait for the result of a network request before it actually updates
                builder: (context, AsyncSnapshot<LightStatus> snapshot) {
                  return new FlatButton(
                      onPressed: _lightsDisplayBloc.activate,
                      child: Text(
                        '${snapshot.data == LightStatus.off ? "OFF" : "ON"}',
                        // ON / OFF
                        style: TextStyle(
                            color:  snapshot.data == LightStatus.off ? Colors.redAccent : Colors.greenAccent,
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                      ));
                }),
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
        ),
        // Column of status displayed relative to the system in previous column
        // Yes, indeed, this should not be hand-built. It's just a learn-by-code thing though.
      ],
    ); // Systems Status Display
  }

  @override
  void dispose() {
    _lightsDisplayBloc.dispose();
    super.dispose();
  }

  void _powerClicked() {
    setState(() {
      _hangar_light = (_hangar_light == "ON") ? "OFF" : "ON";
    });
  }
}
