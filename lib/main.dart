import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_participants_lottery/lottery_logic.dart' as lottery;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Osallistujien arvonta',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: (){}, // TODO: replace with a method that starts a Modal Bottom Sheet. E.g.: https://gallery.flutter.dev/#/demo/bottom-sheet
            icon: const Icon(Icons.settings),
            tooltip: 'Asetukset',
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Puheaika',
              style: Theme.of(context).textTheme.headline3,
            ),
            CircularCountDownTimer(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/2,
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
                  print('Countdown Ended');
                },
            ),
            Text(
              'Järjestys:',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'A, B, C, D',
              style: Theme.of(context).textTheme.headline6,
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: 'Nimet (erottele pilkulla)'
            //   ),
            // ),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.shuffle,size: 18,), label: Text("Arvo"))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
          ),
          _button(title: "Start", onPressed: () => _countDownController.start()),
          SizedBox(
            width: 10,
          ),
          _button(title: "Pause", onPressed: () => _countDownController.pause()),
          SizedBox(
            width: 10,
          ),
          _button(title: "Resume", onPressed: () => _countDownController.resume()),
          SizedBox(
            width: 10,
          ),
          _button(
              title: "Restart",
              onPressed: () => _countDownController.restart(duration: _duration))
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
              primary: Colors.green, // background
              onPrimary: Colors.white, // foreground
            )
        ));
  }
}
