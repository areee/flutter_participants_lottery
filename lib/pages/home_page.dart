import 'package:flutter/material.dart';
import 'package:flutter_participants_lottery/components/custom_app_bar.dart';
import 'package:flutter_participants_lottery/components/custom_bottom_app_bar.dart';
import 'package:flutter_participants_lottery/components/home_app_bar_actions.dart';
import 'package:flutter_participants_lottery/components/home_body_content.dart';
import 'package:flutter_participants_lottery/controllers/controller.dart';
import 'package:flutter_participants_lottery/static.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    final ac = (MediaQuery.of(context).size.width / 140).round();

    return Scaffold(
      appBar: customAppBar(context, title, appBarActions(context)),
      body: HomePageBodyContent(controller: c, axisCount: ac),
      floatingActionButton: Obx(() => FloatingActionButton(
            onPressed: () {
              c.timerStatus.value == TimerStatus.running
                  ? c.setPaused()
                  : c.setRunning();
            },
            tooltip: c.timerStatus.value == TimerStatus.running
                ? 'Tauko'
                : 'Käynnistä',
            child: Icon(
              c.timerStatus.value == TimerStatus.running
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}



// class _HomeState extends State<Home> {
//   final _countDownController = CountDownController();
//   final _duration = 90;
//   final _textEditingController = TextEditingController();
//   var _participantNamesInList = <String>[];

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   /// Load data in SharedPreferences on start
//   void _loadData() async {
//     final prefs = await SharedPreferences.getInstance();

//     setState(() {
//       _participantNamesInList =
//           prefs.getStringList('participantNamesInList') ?? <String>[];
//     });
//   }

//   /// When the time's up, show an emoji alert
//   void _timeIsUp() {
//     if (kDebugMode) {
//       print('Time\'s Up');
//     }

//     EmojiAlert(
//         emojiType: EMOJI_TYPE.WINK,
//         background: Theme.of(context).colorScheme.background,
//         enableMainButton: true,
//         mainButtonText: Text(
//           'Sulje',
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
//         mainButtonColor: Theme.of(context).colorScheme.primary,
//         onMainButtonPressed: () {
//           Navigator.pop(context);
//         },
//         description: Column(
//           children: [
//             Text(
//               'Aika loppui',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         )).displayAlert(context);
//   }

//   /// Run lottery when the button is clicked
//   Future<void> _runLottery() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _participantNamesInList = _participantNamesInList.runLotteryList();
//       prefs.setStringList('participantNamesInList', _participantNamesInList);
//     });
//   }

//   Future<void> _displayTextInputDialog(BuildContext context) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text(
//               'Asetukset',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             content: SizedBox(
//               width: 350,
//               child: TextField(
//                 controller: _textEditingController
//                   ..text =
//                       _participantNamesInList.listIntoCommaSeparatedString(),
//                 style: Theme.of(context).textTheme.bodyLarge,
//                 decoration: const InputDecoration(
//                   labelText: 'Syötä nimet, erottele pilkuilla',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 child: Text(
//                   'Peruuta',
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     Navigator.pop(context);
//                   });
//                 },
//               ),
//               TextButton(
//                 child: Text(
//                   'OK',
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//                 onPressed: () async {
//                   _setParticipantNames(context);
//                 },
//               ),
//             ],
//           );
//         });
//   }

//   Future<void> _setParticipantNames(BuildContext context) async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _participantNamesInList =
//           _textEditingController.text.commaSeparatedStringIntoList();
//       prefs.setStringList('participantNamesInList', _participantNamesInList);
//       Navigator.pop(context);
//     });
//   }

//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final axisCount = (MediaQuery.of(context).size.width / 140).round();

//     List<Widget> actions = [
//       IconButton(
//         onPressed: () {
//           _displayTextInputDialog(context);
//         },
//         icon: const Icon(Icons.settings),
//         tooltip: 'Asetukset',
//       )
//     ];

//     return Scaffold(
//       appBar: customAppBar(
//         context,
//         widget.title,
//         actions,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const SizedBox(height: 40),
//               CircularCountDownTimer(
//                 width: MediaQuery.of(context).size.width / 2,
//                 height: MediaQuery.of(context).size.height / 2,
//                 duration: _duration,
//                 initialDuration: 0,
//                 fillColor: Theme.of(context).colorScheme.secondary,
//                 ringColor: Colors.grey[300]!,
//                 controller: _countDownController,
//                 ringGradient: null,
//                 fillGradient: null,
//                 backgroundColor: Theme.of(context).colorScheme.primary,
//                 backgroundGradient: null,
//                 strokeWidth: 20.0,
//                 strokeCap: StrokeCap.round,
//                 textStyle: Theme.of(context).textTheme.displaySmall,
//                 textFormat: CountdownTextFormat.MM_SS,
//                 isReverse: true,
//                 isReverseAnimation: true,
//                 isTimerTextShown: true,
//                 autoStart: false,
//                 onStart: () {
//                   if (kDebugMode) {
//                     print('Countdown Started');
//                   }
//                 },
//                 onComplete: () {
//                   _timeIsUp();
//                 },
//               ),
//               const SizedBox(height: 40),
//               RunLotteryButton(
//                 _participantNamesInList.isEmpty ? null : _runLottery,
//                 _participantNamesInList.length,
//               ),
//               _participantNamesInList.isNotEmpty
//                   ? GridView.count(
//                       shrinkWrap: true,
//                       crossAxisCount: axisCount,
//                       children: _participantNamesInList
//                           .map((name) => AvatarWidget(name: name))
//                           .toList(),
//                     )
//                   : Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Text(
//                         'Vinkki: lisää osallistujat oikean yläkulman asetukset-napista!',
//                         style: Theme.of(context).textTheme.bodyLarge,
//                       ),
//                     ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(
//             width: 30,
//           ),
//           CountdownButton(
//             'Aloita',
//             () => _countDownController.start(),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           CountdownButton(
//             'Tauko',
//             () => _countDownController.pause(),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           CountdownButton(
//             'Jatka',
//             () => _countDownController.resume(),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }
