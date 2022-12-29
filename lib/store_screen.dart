import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key, required this.counter, required this.add, required this.sound, required this.dark}) : super(key: key);
  final int counter;
  final int add;
  final int sound;
  final int dark;

  @override
  StoreScreenState createState() => StoreScreenState();
}

class StoreScreenState extends State<StoreScreen> {
  late int _add = widget.add;
  late int _counter = widget.counter;
  late final int _sound = widget.sound;
  late final int _dark = widget.dark;
  var list = [];

  void setAdd(add) async {
    setState(() {
      _add = add;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('add', _add);
  }

  void setCounter(counter) async {
    setState(() {
      _counter = counter;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', _counter);
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
                      child: Text('Upgrades',
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
                      if (_add < 2 && _counter >= 100) {
                        if (_sound == 1) {
                          SystemSound.play(SystemSoundType.click);
                        }
                        _counter = ((_counter - 100) / 10).floor() * 10;
                        setAdd(2);
                        setCounter(_counter);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'images/grandma.png'),
                        ),
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
                                TextSpan(text: _add < 2 ? 'Grandma (2x) : 100 ' : 'Grandma (2x)', style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Kavoon-Regular",
                                )),
                                WidgetSpan(
                                  child: _add < 2 ? const Icon(Icons.cookie, color: Colors.white) : const SizedBox.shrink(),
                                ),
                                TextSpan(text: _add >= 2 ? '   ✓' : '', style: const TextStyle(
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
                      if (_add < 5 && _counter >= 500) {
                        if (_sound == 1) {
                          SystemSound.play(SystemSoundType.click);
                        }
                        _counter = ((_counter - 500) / 10).floor() * 10;
                        setAdd(5);
                        setCounter(_counter);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'images/robot.png'),
                        ),
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
                                TextSpan(text: _add < 5 ? 'Robot (5x) : 500 ' : 'Robot (5x)', style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Kavoon-Regular",
                                )),
                                WidgetSpan(
                                  child: _add < 5 ? const Icon(Icons.cookie, color: Colors.white) : const SizedBox.shrink(),
                                ),
                                TextSpan(text: _add >= 5 ? '   ✓' : '', style: const TextStyle(
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
                      if (_add < 10 && _counter >= 2000) {
                        if (_sound == 1) {
                          SystemSound.play(SystemSoundType.click);
                        }
                        _counter = ((_counter - 2000) / 10).floor() * 10;
                        setAdd(10);
                        setCounter(_counter);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'images/factory.png'),
                        ),
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
                                TextSpan(text: _add < 10 ? 'Factory (10x) : 2000 ' : 'Factory (10x)', style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Kavoon-Regular",
                                )),
                                WidgetSpan(
                                  child: _add < 10 ? const Icon(Icons.cookie, color: Colors.white) : const SizedBox.shrink(),
                                ),
                                TextSpan(text: _add >= 10 ? '   ✓' : '', style: const TextStyle(
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
                      if (_add < 20 && _counter >= 5000) {
                        if (_sound == 1) {
                          SystemSound.play(SystemSoundType.click);
                        }
                        _counter = ((_counter - 5000) / 10).floor() * 10;
                        setAdd(20);
                        setCounter(_counter);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'images/monopoly.png'),
                        ),
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
                                TextSpan(text: _add < 20 ? 'Monopoly (20x) : 5000 ' : 'Monopoly (20x)', style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Kavoon-Regular",
                                )),
                                WidgetSpan(
                                  child: _add < 20 ? const Icon(Icons.cookie, color: Colors.white) : const SizedBox.shrink(),
                                ),
                                TextSpan(text: _add >= 20 ? '   ✓' : '', style: const TextStyle(
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
                    list.add(_add);
                    list.add(_counter);
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
