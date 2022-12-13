import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key, required this.counter, required this.add}) : super(key: key);
  final int counter;
  final int add;

  @override
  StoreScreenState createState() => StoreScreenState();
}

class StoreScreenState extends State<StoreScreen> {
  late int _add = widget.add;
  late int _counter = widget.counter;
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: widget.counter == 0 ? MainAxisAlignment.center : MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (_add < 2 && _counter >= 300) {
                  list.add(2);
                  list.add(_counter - 300);
                  setAdd(2);
                  setCounter(_counter - 300);
                }
              },
              child: Container(
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange,
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
                          const TextSpan(text: 'Grandma (2x): 300 ', style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          )),
                          const WidgetSpan(
                            child: Icon(Icons.cookie, color: Colors.white),
                          ),
                          TextSpan(text: _add >= 2 ? '      ✓' : '', style: const TextStyle(
                            color: Colors.brown,
                            fontSize: 22.0,
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
                if (_add < 3 && _counter >= 1000) {
                  list.add(3);
                  list.add(_counter - 1000);
                  setAdd(3);
                  setCounter(_counter - 1000);
                }
              },
              child: Container(
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange,
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
                          const TextSpan(text: 'Store (3x): 1000 ', style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          )),
                          const WidgetSpan(
                            child: Icon(Icons.cookie, color: Colors.white),
                          ),
                          TextSpan(text: _add >= 3 ? '          ✓' : '', style: const TextStyle(
                            color: Colors.brown,
                            fontSize: 22.0,
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
                if (_add < 5 && _counter >= 2000) {
                  list.add(5);
                  list.add(_counter - 2000);
                  setAdd(5);
                  setCounter(_counter - 2000);
                }
              },
              child: Container(
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange,
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
                        const TextSpan(text: 'Factory (5x): 2000 ', style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        )),
                        const WidgetSpan(
                          child: Icon(Icons.cookie, color: Colors.white),
                        ),
                        TextSpan(text: _add >= 5 ? '       ✓' : '', style: const TextStyle(
                          color: Colors.brown,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        )),
                      ],
                    ),
                  )
                ),
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
          padding: const EdgeInsets.only(top: 90.0, bottom: 40.0),
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
    return Text(widget.counter == 1 ? '$_counter Cookie!' : '$_counter Cookies!', style: const TextStyle(color: Colors.white, fontSize: 25.0, fontFamily: "Kavoon-Regular"));
  }

  Widget progress() {
    return LinearProgressIndicator(value: (((25 + sqrt(625 + 100 * widget.counter)) / 50) - ((25 + sqrt(625 + 100 * widget.counter)) / 50).floor()), minHeight: 10);
  }
}
