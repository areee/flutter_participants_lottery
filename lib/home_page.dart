import 'package:emoji_alert/arrays.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'components/custom_app_bar.dart';
import 'src/countdown_button.dart';
import 'src/lottery_logic.dart' as lottery;
import 'src/string_helper.dart' as string_helper;
import 'src/avatar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _countDownController = CountDownController();
  final _duration = 90;
  final _textEditingController = TextEditingController();
  var _participantNamesInList = <String>[];

  @override
  void initState() {
    super.initState();
    _loadData();
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
            string_helper.commaSeparatedStringIntoList(oldWay);
        prefs.setStringList('participantNamesInList', _participantNamesInList);
        prefs.setString('participantNames', '');
      } else {
        _participantNamesInList = newWay;
      }
    });
  }

  /// When the time's up, show an emoji alert
  void _timeIsUp() {
    if (kDebugMode) {
      print('Time\'s Up');
    }

    EmojiAlert(
        emojiType: EMOJI_TYPE.WINK,
        background: Theme.of(context).colorScheme.background,
        enableMainButton: true,
        mainButtonText: Text(
          'Sulje',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        mainButtonColor: Theme.of(context).colorScheme.primary,
        onMainButtonPressed: () {
          Navigator.pop(context);
        },
        description: Column(
          children: [
            Text(
              'Aika loppui',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        )).displayAlert(context);
  }

  /// Run lottery when the button is clicked
  void _runLottery() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _participantNamesInList = lottery.runLotteryList(_participantNamesInList);
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
              style: Theme.of(context).textTheme.headline4,
            ),
            content: SizedBox(
              width: 300,
              child: TextField(
                controller: _textEditingController
                  ..text = string_helper
                      .listIntoCommaSeparatedString(_participantNamesInList),
                style: Theme.of(context).textTheme.bodyText1,
                decoration: const InputDecoration(
                  hintText: "Syötä nimet, erottele pilkuilla",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Peruuta',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              TextButton(
                child: Text(
                  'OK',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
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
      _participantNamesInList = string_helper
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
    List<Widget> actions = [
      IconButton(
        onPressed: () {
          _displayTextInputDialog(context);
        },
        icon: const Icon(Icons.settings),
        tooltip: 'Asetukset',
      )
    ];

    return Scaffold(
      appBar: customAppBar(context, widget.title, actions),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Puheaika',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularCountDownTimer(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                duration: _duration,
                initialDuration: 0,
                fillColor: Theme.of(context).colorScheme.secondary,
                ringColor: Colors.grey[300]!,
                controller: _countDownController,
                ringGradient: null,
                fillGradient: null,
                backgroundColor: Theme.of(context).colorScheme.primary,
                backgroundGradient: null,
                strokeWidth: 20.0,
                strokeCap: StrokeCap.round,
                textStyle: Theme.of(context).textTheme.headline3,
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: true,
                isReverseAnimation: true,
                isTimerTextShown: true,
                autoStart: false,
                onStart: () {
                  if (kDebugMode) {
                    print('Countdown Started');
                  }
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
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(
              height: 77,
              child: _participantNamesInList.isNotEmpty
                  ? ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: _participantNamesInList
                          .map((name) => AvatarWidget(participantName: name))
                          .toList(),
                    )
                  : Text(
                      'Vinkki: lisää osallistujat oikean yläkulman asetukset-napista!',
                      style: Theme.of(context).textTheme.bodyText1,
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
              label: Text(
                "Arvo",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
          ),
          CountdownButton(
            "Aloita",
            () => _countDownController.start(),
          ),
          const SizedBox(
            width: 10,
          ),
          CountdownButton(
            "Tauko",
            () => _countDownController.pause(),
          ),
          const SizedBox(
            width: 10,
          ),
          CountdownButton(
            "Jatka",
            () => _countDownController.resume(),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
