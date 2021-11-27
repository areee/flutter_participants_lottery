import 'package:emoji_alert/arrays.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:emoji_alert/emoji_alert.dart';
// import 'package:audioplayers/audioplayers.dart'; // Do not use for now (to support also Windows desktop)
import 'fpl_theme.dart';
import 'src/countdown_button.dart';
import 'src/lottery_logic.dart' as lottery;
import 'src/string_helper.dart' as stringHelper;
import 'src/avatar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var audioCache = AudioCache(); // Do not use for now (to support also Windows desktop)
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
  // void _playLotterySound() {
  // Do not use for now (to support also Windows desktop)
  //   audioCache.play('arvonta_kaynnissa.mp3', mode: PlayerMode.LOW_LATENCY);
  // }

  /// Play a self-made time's up sound (made by Arttu Ylhävuori)
  // void _playTimeIsUpSound() {
  // Do not use for now (to support also Windows desktop)
  //   audioCache.play('aika_loppui.mp3', mode: PlayerMode.LOW_LATENCY);
  // }

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
    // _playTimeIsUpSound(); // Do not use for now (to support also Windows desktop)

    print('Time\'s Up');

    EmojiAlert(
        emojiType: EMOJI_TYPE.WINK,
        background: Theme.of(context).colorScheme.secondary,
        enableMainButton: true,
        mainButtonText: Text('Sulje'),
        mainButtonColor: Theme.of(context).colorScheme.primary,
        onMainButtonPressed: () {
          Navigator.pop(context);
        },
        description: Column(
          children: [
            Text('Aika loppui', style: Theme.of(context).textTheme.headline2),
          ],
        )).displayAlert(context);
  }

  /// Run lottery when the button is clicked
  void _runLottery() async {
    // _playLotterySound(); // Do not use for now (to support also Windows desktop)

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
            title: Text(
              'Syötä nimet',
              style: Theme.of(context).textTheme.headline2,
            ),
            content: TextField(
              controller: _textEditingController
                ..text = stringHelper
                    .listIntoCommaSeparatedString(_participantNamesInList),
              decoration:
                  InputDecoration(hintText: "Syötä nimet, erottele pilkuilla"),
              style: Theme.of(context).textTheme.bodyText1,
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
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: FplTheme.darkTextTheme.headline1,
        ),
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
                style: Theme.of(context).textTheme.headline1,
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
                'Järjestys',
                style: Theme.of(context).textTheme.headline1,
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
                  primary: Theme.of(context).colorScheme.primary),
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
          CountdownButton(
            "Aloita",
            () => _countDownController.start(),
          ),
          SizedBox(
            width: 10,
          ),
          CountdownButton(
            "Tauko",
            () => _countDownController.pause(),
          ),
          SizedBox(
            width: 10,
          ),
          CountdownButton(
            "Jatka",
            () => _countDownController.resume(),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
