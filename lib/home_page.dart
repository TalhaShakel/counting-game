// import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<String> audio = [
    '1.mp3',
    '2.mp3',
    '3.mp3',
    '4.mp3',
    '5.mp3',
    '6.mp3',
    '7.mp3',
    '8.mp3',
    '9.mp3',
    'ten.mp3',
  ];
  bool isplay = false;
  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      // if (isplay) {
                      //   await audioplayer.pause();
                      // } else {
                      try {
                        // String url = "assets/1.mp3";
                        // final player = AudioCache();

                        for (var i = 0; i < audio.length; i++) {
                          String file = audio[i];
                          print(file.toString() + "sssss");

                          await player.play(AssetSource("${file}"));
                          var playingFile = file;
                          while (player.state == PlayerState.playing) {
                            print("while: ${player.state}");
                            print(i);
                            if (player.state == PlayerState.playing) {
                              player.onPlayerComplete.listen((onDone) async {
                                print("object");
                                // player.
                                player.dispose();
                                player.state = PlayerState.completed;
                                await player.stop();
                              });
                            }
                            if (player.state == PlayerState.completed) {
                              print("if: ${player.state}");
                              await player.play(AssetSource(file.toString()));
                              break;
                            }
                          }
                        }

                        // player.load(url);
                      } catch (e) {
                        print(e);
                      }

                      // }
                    },
                    child: Icon(
                      Icons.mic,
                      size: 50,
                    ),
                  ),
                  Icon(
                    Icons.replay_outlined,
                    size: 50,
                  ),
                ],
              ),
              Text(
                "Score",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          color: Colors.grey,
          height: 100,
          width: 200,
        ),
        Spacer(),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          crossAxisSpacing: 48.0,
          mainAxisSpacing: 2.0,
          padding: EdgeInsets.symmetric(horizontal: 25),
          children: List.generate(
            choices.length,
            (index) {
              return Center(
                child: SelectCard(choice: choices[index]),
              );
            },
          ),
        ),
      ],
    ));
  }
}

class Choice {
  Choice({this.title, this.icon});
  final String? title;
  var icon;
}

List<Choice> choices = <Choice>[
  Choice(title: 'Home', icon: "assets/fish_L_01.png"),
  Choice(title: 'Contact', icon: "assets/fish_L_02.png"),
  Choice(title: 'Map', icon: "assets/fish_L_03.png"),
  Choice(title: 'Phone', icon: "assets/fish_L_04.png"),
  Choice(title: 'Camera', icon: "assets/fish_L_05.png"),
  Choice(title: 'Setting', icon: "assets/fish_L_06.png"),
  Choice(title: 'Album', icon: "assets/fish_L_07.png"),
  Choice(title: 'WiFi', icon: "assets/fish_L_08.png"),
  Choice(title: 'WiFi', icon: "assets/fish_L_09.png"),
  Choice(title: 'WiFi', icon: "assets/fish_L_10.png"),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, this.choice}) : super(key: key);
  final Choice? choice;

  @override
  Widget build(BuildContext context) {
    //  TextStyle textStyle = Theme.of(context).textTheme.bodySmall;
    return Center(
      child: Image.asset(
        "${choice!.icon}",
        height: 70,
        // color: Colors.grey,
      ),
    );
  }
} 
