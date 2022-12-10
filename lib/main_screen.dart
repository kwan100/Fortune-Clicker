import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  late int _counter = 0;
  late String _fortune = "Click to Begin";

  void incrementCounter() async {
    setState(() {
      _counter++;
      fetchFortune();
    });
  }

  void fetchFortune() async {
    const url = "http://yerkee.com/api/fortune/wisdom";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    if (json["fortune"].length > 300) {
      fetchFortune();
    }
    else{
      setState(() {
        _fortune = json["fortune"];
      });
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 100,
          title: Column(
            children: [
              Text(_counter == 0 ? 'Fortune Clicker' : 'Fortune #$_counter', style: const TextStyle(color: Colors.white, fontSize: 25.0, fontFamily: "Kavoon-Regular")),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10.0),
                child: Text(_fortune, style: const TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: "Kavoon-Regular")),
              ),
              Center(
                child: GestureDetector(
                  onTap: incrementCounter,
                  onTapDown: _onTapDown,
                  onTapUp: _onTapUp,
                  child: Transform.scale(
                    scale: _scale,
                    child: SizedBox(
                      height: 250,
                      child: Image.asset("images/cookie.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
