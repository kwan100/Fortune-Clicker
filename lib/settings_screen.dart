import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key, required this.counter, required this.sound, required this.dark}) : super(key: key);
  final int counter;
  final int sound;
  final int dark;

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  late final int _counter = widget.counter;
  late int _sound = widget.sound;
  late int _dark = widget.dark;
  var list = [];

  void setSound(sound) async {
    setState(() {
      _sound = sound;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('sound', _sound);
  }

  void setDark(dark) async {
    setState(() {
      _dark = dark;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('dark', _dark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Column(
          children: [
            Text('Level ${((25 + sqrt(625 + 100 * _counter)) / 50).floor()}', style: const TextStyle(color: Colors.white, fontSize: 25.0, fontFamily: "Kavoon-Regular")),
            padding(),
            score(),
            progress(),
          ],
        ),
        backgroundColor: Colors.transparent.withOpacity(0.4),
        elevation: 0.0,
      ),
      body: Container(
        decoration: _dark == 0 ? const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            ))
            : const BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 60.0,
                    child: Center(
                      child: Text('Settings',
                        style: TextStyle(
                          color: _dark == 0 ? Colors.black : Colors.white,
                          fontSize: 23.0,
                          fontFamily: "Kavoon-Regular",
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_sound == 1) {
                        SystemSound.play(SystemSoundType.click);
                      }
                      if (_sound == 1) {
                        setSound(0);
                      }
                      else {
                        setSound(1);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _dark == 0 ? Colors.orange : Colors.black,
                        border: Border.all(
                          color: Colors.brown,
                          width: 4.0,
                        ),
                      ),
                      width: double.infinity,
                      height: 80.0,
                      child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(text: 'Sound', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Kavoon-Regular",
                                )),
                                TextSpan(text: _sound == 1 ? '   ✓' : '', style: const TextStyle(
                                  color: Colors.brown,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_sound == 1) {
                        SystemSound.play(SystemSoundType.click);
                      }
                      if (_dark == 1) {
                        setDark(0);
                      }
                      else {
                        setDark(1);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _dark == 0 ? Colors.orange : Colors.black,
                        border: Border.all(
                          color: Colors.brown,
                          width: 4.0,
                        ),
                      ),
                      width: double.infinity,
                      height: 80.0,
                      child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(text: 'Dark Mode', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Kavoon-Regular",
                                )),
                                TextSpan(text: _dark == 1 ? '   ✓' : '', style: const TextStyle(
                                  color: Colors.brown,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            button(),
          ],
        ),
      ),
    );
  }

  Widget button() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding (
          padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.black87,
            ),
            width: 75.0,
            height: 75.0,
            child: Center(
                child: IconButton(
                  onPressed: (){
                    if (_sound == 1) {
                      SystemSound.play(SystemSoundType.click);
                    }
                    list.add(_sound);
                    list.add(_dark);
                    Navigator.pop(context, list);
                  },
                  icon: const Icon(Icons.home, size: 30.0),
                  color: Colors.white,
                )
            ),
          ),
        )
    );
  }

  Widget padding() {
    return const SizedBox(height: 5);
  }

  Widget score() {
    return Text(widget.counter == 1 ? '$_counter Cookie!' : '$_counter Cookies!', style: const TextStyle(color: Colors.white, fontSize: 23.0, fontFamily: "Kavoon-Regular"));
  }

  Widget progress() {
    return LinearProgressIndicator(value: (((25 + sqrt(625 + 100 * widget.counter)) / 50) - ((25 + sqrt(625 + 100 * widget.counter)) / 50).floor()), minHeight: 10);
  }
}
