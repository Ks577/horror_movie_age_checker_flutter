import 'package:age_checker/widgets/custom_card.dart';
import 'package:age_checker/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _ageController = TextEditingController();
  String _message = " ";
  int _age = 0;

  void ageOnSubmitted(String value) {
    try {
      _age = int.parse(value);
    } on FormatException {
      setState(() {
        _message = "";
      });
    }
  }

  void ageCriteria() {
    setState(() {
      if (_age < 16) {
        _message = "You are too young to see such things.";
      } else if (_age <= 17) {
        _message = "You can come with adults.";
      } else {
        _message = "You can see this movie.";
      }
    });
  }

  void clearText() {
    _ageController.clear();
  }

  final con = FlipCardController();
  final con1 = FlipCardController();
  final cong = GestureFlipCardController();
  final cong1 = GestureFlipCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.gif'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Horror movie',
                  style: TextStyle(
                    fontFamily: 'Caprasimo',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'The BRIDE',
                  style: TextStyle(
                    fontFamily: 'Caprasimo',
                    color: Colors.red,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                GestureFlipCard(
                  enableController: true,
                  controller: cong,
                  animationDuration: const Duration(milliseconds: 600),
                  axis: FlipAxis.horizontal,
                  frontWidget: Center(
                    child: customCard(
                      child: Center(
                        child: customTextField(
                          onChanged: ageOnSubmitted,
                          controller: _ageController,
                        ),
                      ),
                    ),
                  ),
                  backWidget: Center(
                    child: customCard(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            textAlign: TextAlign.center,
                            _message,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  child: const Text('Submitted'),
                  onPressed: () {
                    ageCriteria();
                    clearText();
                    // Flip the card programmatically
                    con1.flipcard();
                    cong.flipcard();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
