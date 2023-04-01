// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:restart_app/restart_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team 203 Pit Scouting App',
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
        primarySwatch: Colors.red,
        fontFamily: 'SofiaSans',
        scaffoldBackgroundColor: Colors.black12,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: Colors.red,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Team 203 Pit Scouting App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

final scouterName = TextEditingController();
final teamNumber = TextEditingController();

final width = TextEditingController();
final length = TextEditingController();

final driveType = TextEditingController();
final numWheels = TextEditingController();
final typeWheels = TextEditingController();
final sizeWheels = TextEditingController();
final typeMotors = TextEditingController();
final typeMotorControllers = TextEditingController();

const List<String> intakeOptions = <String>[
  'Unknown',
  'Passive',
  'Active',
  'Other'
];
String intakeType = intakeOptions.first;
final intakeDesc = TextEditingController();

final liftingDesc = TextEditingController();
final special = TextEditingController();

final sensors = TextEditingController();

const List<String> options = <String>[
  'No',
  'Yes',
  'Sometimes',
];

String moveCone = options.first;
String moveCube = options.first;

const List<String> preferenceOptions = <String>[
  'No Preferece',
  'Cones',
  'Cubes',
];

String preference = preferenceOptions.first;

bool coneCanBeScoredHigh = false;
bool coneCanBeScoredMid = false;
bool coneCanBeScoredLow = false;

bool cubeCanBeScoredHigh = false;
bool cubeCanBeScoredMid = false;
bool cubeCanBeScoredLow = false;

bool coneIsPreferredHigh = false;
bool coneIsPreferredMid = false;
bool coneIsPreferredLow = false;

bool cubeIsPreferredHigh = false;
bool cubeIsPreferredMid = false;
bool cubeIsPreferredLow = false;

String balance = options.first;
String pickFromGround = options.first;
String autoBalance = options.first;

final autoMovePieces = TextEditingController();

String preferredMoveAuto = preferenceOptions.first;

bool autoScoreHigh = false;
bool autoScoreMid = false;
bool autoScoreLow = false;

final autoRoutine = TextEditingController();
final personalNotes = TextEditingController();

const List<String> yesno = <String>['No', 'Yes'];

String pictures = yesno.first;
String revisit = yesno.first;

final _homePageFormKey = GlobalKey<FormState>();
final _secondPageFormKey = GlobalKey<FormState>();

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    teamNumber.dispose();
    super.dispose();
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
      body: Form(
        key: _homePageFormKey,
        child: Center(
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
              Image.asset('assets/frc203.png'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: scouterName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Full Name',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: teamNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the team number you are scouting';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Team Number You Are Scouting',
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(50),
                  child: ButtonTheme(
                      minWidth: 500,
                      height: 100,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: const BorderSide(color: Colors.red))),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.fromLTRB(50, 25, 50, 25))),
                        onPressed: () {
                          if (_homePageFormKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SecondPage(
                                        title: 'Scouting Data',
                                      )),
                            );
                          }
                        },
                        child: const Text('Continue',
                            style: TextStyle(fontSize: 25)),
                      ))),
              const Text('Please Return To Team 203 Pit If Found',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Scouting Data - Team " + teamNumber.text),
      ),
      body: Form(
        key: _secondPageFormKey,
        child: ListView(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            children: <Widget>[
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 20),
                  child: Text("Drivetrain",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 0),
                  child: Text("Width (with bumpers):",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: width,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Width Of The Drivetrain Including Bumpers',
                  ),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 0),
                  child: Text("Length (with bumpers):",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: length,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Length Of The Drivetrain Including Bumpers',
                  ),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 0),
                  child: Text("Drive System Type:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: driveType,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Drive System Type',
                  ),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 0),
                  child: Text("Number of Wheels:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: numWheels,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Number of Wheels',
                  ),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 0),
                  child: Text("Type of Wheels:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: typeWheels,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type of Wheels',
                  ),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 0),
                  child: Text("Type of Motors:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: typeMotors,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type of Motors',
                  ),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 0),
                  child: Text("Type of Motor Controllers:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: typeMotorControllers,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type of Motor Controllers',
                  ),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 20),
                  child: Text("Intake",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Type of Intake:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.redAccent,
                            Colors.deepPurpleAccent,
                            //add more colors
                          ]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.57), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: DropdownButton<String>(
                            value: intakeType,
                            icon: const Icon(Icons.arrow_downward),
                            isExpanded: true,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Colors.red,
                            underline: Container(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                intakeType = value!;
                              });
                            },
                            items: intakeOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 0),
                  child: Text("Intake Details:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: intakeDesc,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Description of Intake System',
                  ),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 20),
                  child: Text("Lifting",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 0),
                  child: Text("Lifting System Details:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: liftingDesc,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Description of Lifting System',
                  ),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 20),
                  child: Text("Sensors",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 0),
                  child: Text("Sensor Details:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: sensors,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        'Description of Sensors (gyro, limelight, etc.) and Amount Each Used',
                  ),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 20),
                  child: Text("Gameplay",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Can Robot Move Cones:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.redAccent,
                            Colors.deepPurpleAccent,
                            //add more colors
                          ]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.57), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: DropdownButton<String>(
                            value: moveCone,
                            icon: const Icon(Icons.arrow_downward),
                            isExpanded: true,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Colors.red,
                            underline: Container(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                moveCone = value!;
                              });
                            },
                            items: options
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Can Robot Move Cubes:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.redAccent,
                            Colors.deepPurpleAccent,
                            //add more colors
                          ]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.57), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: DropdownButton<String>(
                            value: moveCube,
                            icon: const Icon(Icons.arrow_downward),
                            isExpanded: true,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Colors.red,
                            underline: Container(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                moveCube = value!;
                              });
                            },
                            items: options
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Preference for Cones or Cubes:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.redAccent,
                            Colors.deepPurpleAccent,
                            //add more colors
                          ]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.57), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: DropdownButton<String>(
                            value: preference,
                            icon: const Icon(Icons.arrow_downward),
                            isExpanded: true,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Colors.red,
                            underline: Container(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                preference = value!;
                              });
                            },
                            items: preferenceOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Where Can Cones Be Scored:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Low"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: coneCanBeScoredLow,
                onChanged: (bool? value) {
                  setState(() {
                    coneCanBeScoredLow = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Mid"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: coneCanBeScoredMid,
                onChanged: (bool? value) {
                  setState(() {
                    coneCanBeScoredMid = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("High"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: coneCanBeScoredHigh,
                onChanged: (bool? value) {
                  setState(() {
                    coneCanBeScoredHigh = value!;
                  });
                },
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Where Are Cones Preferred To Be Scored:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Low"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: coneIsPreferredLow,
                onChanged: (bool? value) {
                  setState(() {
                    coneIsPreferredLow = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Mid"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: coneIsPreferredMid,
                onChanged: (bool? value) {
                  setState(() {
                    coneIsPreferredMid = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("High"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: coneIsPreferredHigh,
                onChanged: (bool? value) {
                  setState(() {
                    coneIsPreferredHigh = value!;
                  });
                },
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Where Can Cubes Be Scored:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Low"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: cubeCanBeScoredLow,
                onChanged: (bool? value) {
                  setState(() {
                    cubeCanBeScoredLow = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Mid"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: cubeCanBeScoredMid,
                onChanged: (bool? value) {
                  setState(() {
                    cubeCanBeScoredMid = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("High"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: cubeCanBeScoredHigh,
                onChanged: (bool? value) {
                  setState(() {
                    cubeCanBeScoredHigh = value!;
                  });
                },
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Where Are Cubes Preferred To Be Scored:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Low"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: cubeIsPreferredLow,
                onChanged: (bool? value) {
                  setState(() {
                    cubeIsPreferredLow = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Mid"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: cubeIsPreferredMid,
                onChanged: (bool? value) {
                  setState(() {
                    cubeIsPreferredMid = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("High"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: cubeIsPreferredHigh,
                onChanged: (bool? value) {
                  setState(() {
                    cubeIsPreferredHigh = value!;
                  });
                },
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Can Robot Balance:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.redAccent,
                            Colors.deepPurpleAccent,
                            //add more colors
                          ]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.57), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: DropdownButton<String>(
                            value: balance,
                            icon: const Icon(Icons.arrow_downward),
                            isExpanded: true,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Colors.red,
                            underline: Container(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                balance = value!;
                              });
                            },
                            items: options
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Can Robot Pick Up An Object From The Ground:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.redAccent,
                            Colors.deepPurpleAccent,
                            //add more colors
                          ]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.57), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: DropdownButton<String>(
                            value: pickFromGround,
                            icon: const Icon(Icons.arrow_downward),
                            isExpanded: true,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Colors.red,
                            underline: Container(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                pickFromGround = value!;
                              });
                            },
                            items: options
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 20),
                  child: Text("Autonomous",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("During Autonomous, Can Robot Balance:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.redAccent,
                            Colors.deepPurpleAccent,
                            //add more colors
                          ]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.57), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: DropdownButton<String>(
                            value: autoBalance,
                            icon: const Icon(Icons.arrow_downward),
                            isExpanded: true,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Colors.red,
                            underline: Container(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                autoBalance = value!;
                              });
                            },
                            items: options
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 0),
                  child:
                      Text("How Many Pieces Can Robot Move During Autonomous:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: autoMovePieces,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        'Number of Pieces Robot Can Move During Autonomous Period',
                  ),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Which Object is Preferred During Autonomous:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.redAccent,
                            Colors.deepPurpleAccent,
                            //add more colors
                          ]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.57), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: DropdownButton<String>(
                            value: preferredMoveAuto,
                            icon: const Icon(Icons.arrow_downward),
                            isExpanded: true,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Colors.red,
                            underline: Container(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                preferredMoveAuto = value!;
                              });
                            },
                            items: preferenceOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Where Level(s) Does Robot Score In Autonomous:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Low"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: autoScoreLow,
                onChanged: (bool? value) {
                  setState(() {
                    autoScoreLow = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Mid"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: autoScoreMid,
                onChanged: (bool? value) {
                  setState(() {
                    autoScoreMid = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("High"),
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: autoScoreHigh,
                onChanged: (bool? value) {
                  setState(() {
                    autoScoreHigh = value!;
                  });
                },
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Description of Autonomous Routine:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: autoRoutine,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Description of Autonomous Routine',
                  ),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 20),
                  child: Text("Other",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Personal Notes:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: personalNotes,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Any Additional Notes Go Here',
                  ),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Were Pictures Taken Of Robot:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.redAccent,
                            Colors.deepPurpleAccent,
                            //add more colors
                          ]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.57), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: DropdownButton<String>(
                            value: pictures,
                            icon: const Icon(Icons.arrow_downward),
                            isExpanded: true,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Colors.red,
                            underline: Container(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                pictures = value!;
                              });
                            },
                            items: yesno
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )))),
              const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 8),
                  child: Text("Should Team Be Revisisted:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.redAccent,
                            Colors.deepPurpleAccent,
                            //add more colors
                          ]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.57), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: DropdownButton<String>(
                            value: revisit,
                            icon: const Icon(Icons.arrow_downward),
                            isExpanded: true,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Colors.red,
                            underline: Container(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                revisit = value!;
                              });
                            },
                            items: yesno
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )))),
              Container(
                  margin: const EdgeInsets.all(50),
                  child: ButtonTheme(
                      minWidth: 500,
                      height: 100,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: const BorderSide(color: Colors.red))),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.fromLTRB(50, 25, 50, 25))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ThirdPage(
                                      title: 'Generated QR Code',
                                    )),
                          );
                        },
                        child: const Text('Submit',
                            style: TextStyle(fontSize: 25)),
                      ))),
            ]),
      ),
    );
  }
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Generated QR Code"),
      ),
      body: Column(children: [
        const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 20),
            child: Text("Please Present This QR Code To The Designated Scanner",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ))),
        Container(
          alignment: Alignment.center,
          child: QrImage(
            data: (teamNumber.text +
                '*' +
                scouterName.text +
                '*' +
                width.text +
                '*' +
                length.text +
                '*' +
                driveType.text +
                '*' +
                numWheels.text +
                '*' +
                typeWheels.text +
                '*' +
                typeMotors.text +
                '*' +
                typeMotorControllers.text +
                '*' +
                intakeType +
                '*' +
                intakeDesc.text +
                '*' +
                liftingDesc.text +
                '*' +
                sensors.text +
                '*' +
                moveCone +
                '*' +
                moveCube +
                '*' +
                preference +
                '*' +
                (coneCanBeScoredLow ? "TRUE" : "FALSE") +
                '*' +
                (coneCanBeScoredMid ? "TRUE" : "FALSE") +
                '*' +
                (coneCanBeScoredHigh ? "TRUE" : "FALSE") +
                '*' +
                (coneIsPreferredLow ? "TRUE" : "FALSE") +
                '*' +
                (coneIsPreferredMid ? "TRUE" : "FALSE") +
                '*' +
                (coneIsPreferredHigh ? "TRUE" : "FALSE") +
                '*' +
                (cubeCanBeScoredLow ? "TRUE" : "FALSE") +
                '*' +
                (cubeCanBeScoredMid ? "TRUE" : "FALSE") +
                '*' +
                (cubeCanBeScoredHigh ? "TRUE" : "FALSE") +
                '*' +
                (cubeIsPreferredLow ? "TRUE" : "FALSE") +
                '*' +
                (cubeIsPreferredMid ? "TRUE" : "FALSE") +
                '*' +
                (cubeIsPreferredHigh ? "TRUE" : "FALSE") +
                '*' +
                balance +
                '*' +
                pickFromGround +
                '*' +
                autoBalance +
                '*' +
                autoMovePieces.text +
                '*' +
                preferredMoveAuto +
                '*' +
                (autoScoreLow ? "TRUE" : "FALSE") +
                '*' +
                (autoScoreMid ? "TRUE" : "FALSE") +
                '*' +
                (autoScoreHigh ? "TRUE" : "FALSE") +
                '*' +
                autoRoutine.text +
                '*' +
                personalNotes.text +
                '*' +
                pictures +
                '*' +
                revisit +
                '*'),
            version: QrVersions.auto,
            size: MediaQuery.of(context).size.width * 0.78,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        Padding(
            padding:
                const EdgeInsets.only(left: 0, bottom: 20, right: 0, top: 50),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(color: Colors.red))),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.fromLTRB(50, 25, 50, 25))),
              onPressed: () {
                Restart.restartApp();
              },
              child: const Text('Scout Again', style: TextStyle(fontSize: 25)),
            )),
      ]),
    );
  }
}
