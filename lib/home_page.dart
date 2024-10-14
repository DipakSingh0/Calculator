import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> button = [
    'C',
    '%',
    '/',
    'DEL',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '.',
    '0',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Center(child: Text('Calculator', style: TextStyle(color: Colors.black , fontSize: 30),))
      ),
      body: Column(children: [
        // Input/Output container
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
              Container(
                  alignment: Alignment.centerRight,
                  // color: Colors.grey[500],
                  child: Text(
                    userQuestion,
                    style: TextStyle(fontSize: 40),
                  )),
              Container(
                  alignment: Alignment.centerRight,
                  // color: Colors.grey[500],
                  child: Text(
                    userAnswer,
                    style: TextStyle(fontSize: 55),
                  )),
                        ],
                      ),
            )),

        Container(
          height: 5,
          color: Colors.grey[300],
        ),
        //Buttons COntainer
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                // mainAxisSize: MainAxisSize.min,
                  itemCount: button.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    // AC clear button working to nullify everything
                    if (index == 0) {
                      return MyButtons(
                        buttonText: button[index],
                        buttonTapped: () {
                          setState(() {
                            userQuestion = '';
                            userAnswer = '';
                          });
                        },
                        
                      );
                    }
                    // DElETE button to delete the part
                    else if (index == 3) {
                      return MyButtons(
                          buttonText: button[index],
                          buttonTapped: () {
                            setState(
                              () {
                                if (userQuestion.length > 0){
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                }
                                else {
                                  userAnswer = userAnswer.substring(
                                      0, userAnswer.length - 1);
                                }
                              },
                            );
                          });
                    }
            
                    //answer button
                    else if (index == button.length - 2) {
                      return MyButtons(
                          buttonText: button[index],
                          buttonTapped: () {
                            setState(
                              () {
                                // userAnswer =
                                userQuestion = '0';
                              },
                            );
                          });
                    }
                    //equal button
                    else if (index == button.length - 1) {
                      return MyButtons(
                        buttonText: button[index],
                        buttonTapped: () {
                          setState(() {
                              String finalQuestion = userQuestion;
                              finalQuestion =
                                  finalQuestion.replaceAll('x', '*');
                              Parser p = Parser();
                              Expression exp = p.parse(finalQuestion);
                              ContextModel cm = ContextModel();
                              double eval =
                                  exp.evaluate(EvaluationType.REAL, cm);
            
                              userAnswer = eval.toString();
                            }
                          );
                        },
                      );
                    }
            
                    //other buttons
                    else {
                      return MyButtons(
                          buttonText: button[index],
                          buttonTapped: () {
                            setState(
                              () {
                                userQuestion += button[index];
                              },
                            );
                          });
                    }
                  }),
            )),
      ]),
    );
  }

// Equal to button working
  // void equalPressed() {
  //   String finalQuestion = userQuestion;
  //   finalQuestion = finalQuestion.replaceAll('x', '*');
  //   Parser p = Parser();
  //   Expression exp = p.parse(finalQuestion);
  //   ContextModel cm = ContextModel();
  //   double eval = exp.evaluate(EvaluationType.REAL, cm);

  //   userAnswer = eval.toString();
  // }
}
