import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class SkinScreen extends StatefulWidget {
  const SkinScreen({Key? key, required this.counter, required this.sound, required this.dark, required this.pig, required this.cat, required this.leprechaun, required this.selected}) : super(key: key);
  final int counter;
  final int sound;
  final int dark;
  final int pig;
  final int cat;
  final int leprechaun;
  final int selected;

  @override
  SkinScreenState createState() => SkinScreenState();
}

class SkinScreenState extends State<SkinScreen> {
  late int _counter = widget.counter;
  late int _pig = widget.pig;
  late int _cat = widget.cat;
  late int _leprechaun = widget.leprechaun;
  late int _selected = widget.selected;
  late final int _sound = widget.sound;
  late final int _dark = widget.dark;
  var list = [];

  void setCounter(counter) async {
    setState(() {
      _counter = counter;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', _counter);
  }

  void setPig(pig) async {
    setState(() {
      _pig = pig;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('pig', _pig);
  }

  void setCat(cat) async {
    setState(() {
      _cat = cat;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('cat', _cat);
  }

  void setLeprechaun(leprechaun) async {
    setState(() {
      _leprechaun = leprechaun;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('leprechaun', _leprechaun);
  }

  void setSelected(selected) async {
    setState(() {
      _selected = selected;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selected', _selected);
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
                      child: Text('Skins',
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
                      if (_selected != 1) {
                        if (_sound == 1) {
                          SystemSound.play(SystemSoundType.click);
                        }
                        setSelected(1);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'images/cookie.png'),
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
                                const TextSpan(text: 'Fortune Cookie', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Kavoon-Regular",
                                )),
                                TextSpan(text: _selected == 1 ? '   ✓' : '', style: const TextStyle(
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
                      if (_pig == 0 && _counter >= 250) {
                        if (_sound == 1) {
                          SystemSound.play(SystemSoundType.click);
                        }
                        _counter = ((_counter - 250) / 10).floor() * 10;
                        setCounter(_counter);
                        setPig(1);
                        setSelected(2);
                      }
                      else if (_pig == 1 && _selected != 2) {
                        if (_sound == 1) {
                          SystemSound.play(SystemSoundType.click);
                        }
                        setSelected(2);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'images/pig.png'),
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
                                TextSpan(text: _pig == 0 ? 'Piggy Bank : 250 ' : 'Piggy Bank', style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Kavoon-Regular",
                                )),
                                WidgetSpan(
                                  child: _pig == 0 ? const Icon(Icons.cookie, color: Colors.white) : const SizedBox.shrink(),
                                ),
                                TextSpan(text: _selected == 2 ? '   ✓' : '', style: const TextStyle(
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
                      if (_cat == 0 && _counter >= 250) {
                        if (_sound == 1) {
                          SystemSound.play(SystemSoundType.click);
                        }
                        _counter = ((_counter - 250) / 10).floor() * 10;
                        setCounter(_counter);
                        setCat(1);
                        setSelected(3);
                      }
                      else if (_cat == 1 && _selected != 3) {
                        if (_sound == 1) {
                          SystemSound.play(SystemSoundType.click);
                        }
                        setSelected(3);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'images/cat.png'),
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
                                TextSpan(text: _cat == 0 ? 'Lucky Cat : 250 ' : 'Lucky Cat', style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Kavoon-Regular",
                                )),
                                WidgetSpan(
                                  child: _cat == 0 ? const Icon(Icons.cookie, color: Colors.white) : const SizedBox.shrink(),
                                ),
                                TextSpan(text: _selected == 3 ? '   ✓' : '', style: const TextStyle(
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
                      if (_leprechaun == 0 && _counter >= 250) {
                        if (_sound == 1) {
                          SystemSound.play(SystemSoundType.click);
                        }
                        _counter = ((_counter - 250) / 10).floor() * 10;
                        setCounter(_counter);
                        setLeprechaun(1);
                        setSelected(4);
                      }
                      else if (_leprechaun == 1 && _selected != 4) {
                        if (_sound == 1) {
                          SystemSound.play(SystemSoundType.click);
                        }
                        setSelected(4);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'images/leprechaun.png'),
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
                                TextSpan(text: _leprechaun == 0 ? 'Leprechaun : 250 ' : 'Leprechaun', style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Kavoon-Regular",
                                )),
                                WidgetSpan(
                                  child: _leprechaun == 0 ? const Icon(Icons.cookie, color: Colors.white) : const SizedBox.shrink(),
                                ),
                                TextSpan(text: _selected == 4 ? '   ✓' : '', style: const TextStyle(
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
                    list.add(_selected);
                    list.add(_pig);
                    list.add(_cat);
                    list.add(_leprechaun);
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
