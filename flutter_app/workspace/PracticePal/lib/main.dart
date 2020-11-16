import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice Pal',
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Practice Pal'),
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

class Session {
    Session({
      this.name,
      this.date,
      // this.hasVideo = false,
    });

    String name;
    DateTime date;
    // bool hasVideo;
  }

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Session> _sessions = <Session>[Session(name: "Sweet gainz", date: new DateTime.utc(2020, 10, 18)),
                                      Session(name: "Pumpin' Uranium", date: new DateTime.utc(2020, 9, 22)),
                                      Session(name: "Something else funny", date: new DateTime.utc(2020, 7, 2))];

  // Text editing controllers for all text fields
  TextEditingController _nameController;
  TextEditingController _dateController;
  TextEditingController _hourController;
  TextEditingController _minuteController;

  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _dateController = TextEditingController();
    _hourController = TextEditingController();
    _minuteController = TextEditingController();
  }

  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  // Callback for "plus" button
  void _addSession() async {
    Session newSession = new Session();
    final _formKey = GlobalKey<FormState>();
    final _formKey2 = GlobalKey<FormState>();
    
    await showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Select assignment'),
        children: <Widget>[
          InputDatePickerFormField (
            firstDate: new DateTime(0),
            lastDate: new DateTime.now(),
            initialDate: new DateTime.now(),
            onDateSubmitted: (date) {
              newSession.date = date;
            }
          ),
          Form(
            key: _formKey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _hourController,
                  decoration: const InputDecoration(
                    hintText: 'Enter hours',
                  ),
                  // initialValue: '0',
                  validator: (value) {
                    if (value.isEmpty) {
                      return null;
                    }
                    else if(int.parse(value) == null) {
                      return 'Must be a number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _minuteController,
                  decoration: const InputDecoration(
                    hintText: 'Enter minutes',
                  ),
                  // initialValue: '10',
                  validator: (value) {
                    if (value.isEmpty) {
                      return null;
                    }
                    else if(int.parse(value) == null) {
                      return 'Must be a number';
                    }
                    else if(int.parse(value) > 59) {
                      return 'Minutes cannot be more than 60';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter session name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),                
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  _sessions.insert(0,Session(name: _nameController.text, date: new DateTime.now()));
                  Navigator.pop(context);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      );
      
    });
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // _sessions.insert(0,Session(name: "New Practice", date: new DateTime.now()));
      
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
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _sessions.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: FlutterLogo(),
                title: Text(DateFormat("MM/dd/yyyy").format( _sessions[index].date) + " " + _sessions[index].name),
                trailing: Icon(Icons.more_vert),
              ),
            );
          }
        ),

        // child: ListView(
        //   children: const <Widget>[
        //     Card(child: ListTile(title: Text('One-line ListTile'))),
        //     Card(
        //       child: ListTile(
        //         leading: FlutterLogo(),
        //         title: Text('One-line with leading widget'),
        //       ),
        //     ),
        //     Card(
        //       child: ListTile(
        //         title: Text('One-line with trailing widget'),
        //         trailing: Icon(Icons.more_vert),
        //       ),
        //     ),
        //     Card(
        //       child: ListTile(
        //         leading: FlutterLogo(),
        //         title: Text('One-line with both widgets'),
        //         trailing: Icon(Icons.more_vert),
        //       ),
        //     ),
        //     Card(
        //       child: ListTile(
        //         title: Text('One-line dense ListTile'),
        //         dense: true,
        //       ),
        //     ),
        //     Card(
        //       child: ListTile(
        //         leading: FlutterLogo(size: 56.0),
        //         title: Text('Two-line ListTile'),
        //         subtitle: Text('Here is a second line'),
        //         trailing: Icon(Icons.more_vert),
        //       ),
        //     ),
        //     Card(
        //       child: ListTile(
        //         leading: FlutterLogo(size: 72.0),
        //         title: Text('Three-line ListTile'),
        //         subtitle: Text(
        //           'A sufficiently long subtitle warrants three lines.'
        //         ),
        //         trailing: Icon(Icons.more_vert),
        //         isThreeLine: true,
        //       ),
        //     ),
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addSession,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
