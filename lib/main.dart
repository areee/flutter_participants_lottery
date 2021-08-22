import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:flutter_participants_lottery/lottery_logic.dart' as lottery;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Osallistujien arvonta',
      theme: ThemeData(
          brightness: Brightness.light, primaryColor: Colors.lightGreen),
      // Provide light theme
      darkTheme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.lightGreen),
      home: MyHomePage(title: 'Osallistujien arvonta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CountDownController _countDownController = CountDownController();
  int _duration = 90;
  TextEditingController _textEditingController = TextEditingController();
  String _participantNames = '';
  String _valueText = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Load data in SharedPreferences on start
  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _participantNames = (prefs.getString('participantNames') ?? '');
      _valueText = (prefs.getString('participantNames') ?? '');
    });
  }

  // Run lottery when the button is clicked
  void _runLottery() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _participantNames = lottery.runLottery(_participantNames);
      prefs.setString('participantNames', _participantNames);
    });
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Syötä nimet'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  _valueText = value;
                });
              },
              controller: _textEditingController..text = _participantNames,
              decoration:
                  InputDecoration(hintText: "Syötä nimet, erottele pilkuilla"),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Peruuta'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  setState(() {
                    _participantNames = _valueText;
                    prefs.setString('participantNames', _participantNames);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              _displayTextInputDialog(context);
            },
            icon: const Icon(Icons.settings),
            tooltip: 'Asetukset',
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Puheaika',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularCountDownTimer(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                duration: _duration,
                initialDuration: 0,
                fillColor: Colors.greenAccent[700]!,
                ringColor: Colors.grey[300]!,
                controller: _countDownController,
                ringGradient: null,
                fillGradient: null,
                backgroundColor: Colors.green[700],
                backgroundGradient: null,
                strokeWidth: 20.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                    fontSize: 33.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textFormat: CountdownTextFormat.S,
                isReverse: true,
                isReverseAnimation: true,
                isTimerTextShown: true,
                autoStart: false,
                onStart: () {
                  print('Countdown Started');
                },
                onComplete: () => EmojiAlert(
                    description: Column(
                  children: [
                    Text("Aika loppui"),
                  ],
                )).displayAlert(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Järjestys:',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$_participantNames',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  _runLottery();
                },
                icon: const Icon(
                  Icons.shuffle,
                  size: 18,
                ),
                label: Text("Arvo"),
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
          ),
          _button(
              title: "Aloita", onPressed: () => _countDownController.start()),
          SizedBox(
            width: 10,
          ),
          _button(
              title: "Tauko", onPressed: () => _countDownController.pause()),
          SizedBox(
            width: 10,
          ),
          _button(
              title: "Jatka", onPressed: () => _countDownController.resume()),
          SizedBox(
            width: 10,
          ),
          _button(
              title: "Aloita alusta",
              onPressed: () =>
                  _countDownController.restart(duration: _duration))
        ],
      ),
    );
  }

  _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
        child: ElevatedButton(
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              onPrimary: Colors.white,
            )));
  }
}
