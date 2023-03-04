import 'package:emoji_alert/arrays.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/services.dart';
import 'package:flutter_participants_lottery/components/run_lottery_button.dart';
import 'package:flutter_participants_lottery/extensions/string_extension.dart';
import 'package:flutter_participants_lottery/extensions/string_list_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'components/custom_app_bar.dart';
import 'src/countdown_button.dart';
import 'components/avatar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _countDownController = CountDownController();
  final _formKey = GlobalKey<FormState>();
  final _participantNameController = TextEditingController();
  final _secondsController = TextEditingController();
  var _participantNamesInList = <String>[];
  var _duration = 90;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  /// Load data in SharedPreferences on start
  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _participantNamesInList =
          prefs.getStringList('participantNamesInList') ?? <String>[];
      _duration = prefs.getInt('duration') ?? 90;
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
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        mainButtonColor: Theme.of(context).colorScheme.primary,
        onMainButtonPressed: () {
          Navigator.pop(context);
        },
        description: Column(
          children: [
            Text(
              'Aika loppui',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        )).displayAlert(context);
  }

  /// Run lottery when the button is clicked
  Future<void> _runLottery() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _participantNamesInList = _participantNamesInList.runLotteryList();
      prefs.setStringList('participantNamesInList', _participantNamesInList);
    });
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Asetukset',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: _secondsController
                        ..text = _duration.toString(),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      style: Theme.of(context).textTheme.bodyLarge,
                      decoration: const InputDecoration(
                        labelText: 'Ajastimen kesto sekunteina',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Syötä sekuntit';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: _participantNameController
                        ..text = _participantNamesInList
                            .listIntoCommaSeparatedString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                      decoration: const InputDecoration(
                        labelText: 'Syötä nimet, erottele pilkuilla',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Syötä vähintään yksi nimi';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Peruuta',
                  style: Theme.of(context).textTheme.bodyLarge,
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
                  style: Theme.of(context).textTheme.bodyLarge,
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

    if (_formKey.currentState!.validate()) {
      setState(() {
        _participantNamesInList =
            _participantNameController.text.commaSeparatedStringIntoList();
        prefs.setStringList('participantNamesInList', _participantNamesInList);

        _duration = int.parse(_secondsController.text);
        prefs.setInt('duration', _duration);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Asetukset tallennettu')),
        );
        Navigator.pop(context);
      });
    }
  }

  @override
  void dispose() {
    _participantNameController.dispose();
    _secondsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final axisCount = (MediaQuery.of(context).size.width / 140).round();

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
      appBar: customAppBar(
        context,
        widget.title,
        actions,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              CircularCountDownTimer(
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
                textStyle: Theme.of(context).textTheme.displaySmall,
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
              const SizedBox(height: 40),
              RunLotteryButton(
                _participantNamesInList.isEmpty ? null : _runLottery,
                _participantNamesInList.length,
              ),
              _participantNamesInList.isNotEmpty
                  ? GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: axisCount,
                      children: _participantNamesInList
                          .map((name) => AvatarWidget(name: name))
                          .toList(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Vinkki: lisää osallistujat oikean yläkulman asetukset-napista!',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
          ),
          CountdownButton(
            'Aloita',
            () => _countDownController.start(),
          ),
          const SizedBox(
            width: 10,
          ),
          CountdownButton(
            'Tauko',
            () => _countDownController.pause(),
          ),
          const SizedBox(
            width: 10,
          ),
          CountdownButton(
            'Jatka',
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
