import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final buttonText;
  final textColor = Colors.black;
  final buttonTapped;

  MyButtons({
    required this.buttonText,
    required this.buttonTapped,
  });

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    // var screenWidth = screenSize.width;
    // var screenHeight = screenSize.height;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        splashColor: Colors.grey[100],
        onTap: buttonTapped,
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                // height: screenHeight / 4 - 100,
                // width: screenWidth / 4 - 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500] ?? Colors.grey,
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, 4.0),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(buttonText,
                    style: TextStyle(color: textColor, fontSize: 25)),
                )),
          ),
        ),
      ),
    );
  }
}
