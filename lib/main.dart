import 'package:emoji_alert/arrays.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:audioplayers/audioplayers.dart';
import 'src/lottery_logic.dart' as lottery;
import 'src/string_helper.dart' as stringHelper;
import 'src/avatar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
        brightness: Brightness.light, primaryColor: Colors.lightGreen);

    final ThemeData darkTheme =
        ThemeData(brightness: Brightness.dark, primaryColor: Colors.lightGreen);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Osallistujien arvonta',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(secondary: Colors.white)),
      darkTheme: darkTheme.copyWith(
          colorScheme: darkTheme.colorScheme.copyWith(secondary: Colors.black)),
      home: MyHomePage(title: 'Osallistujien arvonta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var audioCache = AudioCache();
  var _countDownController = CountDownController();
  var _duration = 90;
  var _textEditingController = TextEditingController();
  var _participantNamesInList = <String>[];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  /// Play a self-made lottery sound (made by Arttu Ylhävuori)
  void _playLotterySound() {
    audioCache.play('arvonta_kaynnissa.mp3', mode: PlayerMode.LOW_LATENCY);
  }

  /// Play a self-made time's up sound (made by Arttu Ylhävuori)
  void _playTimeIsUpSound() {
    audioCache.play('aika_loppui.mp3', mode: PlayerMode.LOW_LATENCY);
  }

  /// Load data in SharedPreferences on start
  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    var oldWay = prefs.getString('participantNames') ?? '';
    var newWay = prefs.getStringList('participantNamesInList') ?? <String>[];

    setState(() {
      // If the user's local storage has already some old comma-separated string names
      if (oldWay.isNotEmpty && newWay.isEmpty) {
        _participantNamesInList =
            stringHelper.commaSeparatedStringIntoList(oldWay);
        prefs.setStringList('participantNamesInList', _participantNamesInList);
        prefs.setString('participantNames', '');
      } else {
        _participantNamesInList = newWay;
      }
    });
  }

  /// When the time's up, show an emoji alert
  void _timeIsUp() {
    _playTimeIsUpSound();

    EmojiAlert(
        emojiType: EMOJI_TYPE.WINK,
        background: Theme.of(context).colorScheme.secondary,
        enableMainButton: true,
        mainButtonText: Text('Sulje'),
        mainButtonColor: Theme.of(context).primaryColor,
        onMainButtonPressed: () {
          Navigator.pop(context);
        },
        description: Column(
          children: [
            Text('Aika loppui', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        )).displayAlert(context);
  }

  /// Run lottery when the button is clicked
  void _runLottery() async {
    _playLotterySound();

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _participantNamesInList =
          lottery.runLotteryListReturnList(_participantNamesInList);
      prefs.setStringList('participantNamesInList', _participantNamesInList);
    });
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Syötä nimet'),
            content: TextField(
              controller: _textEditingController
                ..text = stringHelper
                    .listIntoCommaSeparatedString(_participantNamesInList),
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
                  _setParticipantNames(context);
                },
              ),
            ],
          );
        });
  }

  Future<void> _setParticipantNames(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _participantNamesInList = stringHelper
          .commaSeparatedStringIntoList(_textEditingController.text);
      prefs.setStringList('participantNamesInList', _participantNamesInList);
      Navigator.pop(context);
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
        backgroundColor: Theme.of(context).primaryColor,
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
                onComplete: () {
                  _timeIsUp();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Järjestys:',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Container(
              height: 70,
              child: _participantNamesInList.length > 0
                  ? new ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: _participantNamesInList
                          .map((name) => AvatarWidget(participantName: name))
                          .toList(),
                    )
                  : Text(
                      'Vinkki: lisää osallistujat oikean yläkulman asetukset-napista!',
                      style: TextStyle(color: Colors.grey),
                    ),
            ),
            ElevatedButton.icon(
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
