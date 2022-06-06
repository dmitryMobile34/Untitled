import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: UpdateScreen(),
  ));
}

class UpdateScreen extends StatefulWidget{
  @override
  UpdateScreenState createState() => UpdateScreenState();

}

class UpdateScreenState extends State<UpdateScreen> {

  var hp = "500";
  var deadHP = "dead";
  var aliveHP = 500;
  var checkHP = false;
  var opacity = 0.0;

  var test = "";

  static final facebookAppEvents = FacebookAppEvents();
  // AppEventsLogger logger = AppEventsLogger.newLogger(this);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            child: Stack(
                children: [
                  SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(
                          "assets/images/jungle.png",
                        ),
                      )
                  ),
                  const Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          "Defeat me.",
                          style: TextStyle(
                              inherit: true,
                              fontSize: 24.0,
                              color: Colors.deepOrange,
                              shadows: [
                                Shadow( // bottomLeft
                                    offset: Offset(-1.5, -1.5),
                                    color: Colors.black
                                ),
                                Shadow( // bottomRight
                                    offset: Offset(1.5, -1.5),
                                    color: Colors.black
                                ),
                                Shadow( // topRight
                                    offset: Offset(1.5, 1.5),
                                    color: Colors.black
                                ),
                                Shadow( // topLeft
                                    offset: Offset(-1.5, 1.5),
                                    color: Colors.black
                                ),]
                          ),
                        ),
                      ),
                    ),
                  Center(
                    child: IconButton(
                      icon: Image.asset("assets/images/dino.png"),
                      iconSize: 300,
                      onPressed: () {


                          // facebookAppEvents.logEvent(
                          //     name: 'button_clicked',
                          //     parameters: {
                          //       'button_id': 'the_clickme_button',
                          //     },);


                        setState(() {
                          if (aliveHP > 50) {
                            aliveHP = aliveHP - 50;
                            hp = aliveHP.toString();
                            print(hp);
                            checkHP = true;
                            return;
                          } else {
                            hp = deadHP;
                            opacity = 1.0;
                            print(opacity);
                          }
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(80),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                          hp.toString(),
                          style: const TextStyle(
                              inherit: true,
                              fontSize: 40.0,
                              color: Colors.pink,
                              shadows: [
                                Shadow( // bottomLeft
                                    offset: Offset(-1.5, -1.5),
                                    color: Colors.black
                                ),
                                Shadow( // bottomRight
                                    offset: Offset(1.5, -1.5),
                                    color: Colors.black
                                ),
                                Shadow( // topRight
                                    offset: Offset(1.5, 1.5),
                                    color: Colors.black
                                ),
                                Shadow( // topLeft
                                    offset: Offset(-1.5, 1.5),
                                    color: Colors.black
                                ),
                              ]
                          ),
                        ),
                      ),
                      ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 500.0),
                      child: Opacity(
                        opacity: opacity,
                        child: MaterialButton(
                          height: 60,
                          minWidth: 200,
                          color: Colors.red,
                          child: const Text(
                              "FLUTTER CALL"
                          ),
                          onPressed: () {
                            setState(() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => super.widget));
                            });},
                          ),
                        ),
                      ),
                    ),
                ])
        ),
      ),
    );
  }
}