import 'package:flutter/material.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as inset;

class MyButtons extends StatefulWidget {
  final String buttonText;
  final Function buttonTapped;

  const MyButtons({
    required this.buttonText,
    required this.buttonTapped,
    super.key,
  });

  @override
  _MyButtonsState createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  bool buttonTapped = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;

    Offset distance = buttonTapped ? const Offset(10, 10) : const Offset(15,15);
    double blur = buttonTapped ? 8.0 : 5.0;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(      //can also use Inkwell for interactive
        // splashColor: Colors.grey[100],
        onTap: () {
          widget.buttonTapped();
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Listener(
              onPointerDown: (_) => setState(() => buttonTapped = true),
              onPointerUp: (_) => setState(() => buttonTapped = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height: screenHeight / 4,
                width: screenWidth / 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFE7ECEF),
                  borderRadius: const BorderRadius.all(Radius.circular(35)),
                  boxShadow: [
                    inset.BoxShadow(
                      blurRadius: blur,
                      offset: -distance,
                      color: Colors.white,
                      inset: buttonTapped,
                    ),
                    inset.BoxShadow(
                      blurRadius: blur,
                      offset: distance,
                      color: Color(0xFFA7A9AF),
                      inset: buttonTapped,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    widget.buttonText,
                    style: const TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class MyButtons extends StatelessWidget {
//   final buttonText;
//   final textColor = Colors.black;
//   final buttonTapped;

//   MyButtons({
//     required this.buttonText,
//     required this.buttonTapped,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // var screenSize = MediaQuery.of(context).size;
//     // var screenWidth = screenSize.width;
//     // var screenHeight = screenSize.height;
//     return Padding(
//       padding: const EdgeInsets.all(1.0),
//       child: InkWell(
//         splashColor: Colors.grey[100],
//         onTap: buttonTapped,
//         child: ClipRRect(
//           // borderRadius: BorderRadius.circular(10),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//                 // height: screenHeight / 4 - 100,
//                 // width: screenWidth / 4 - 100,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.all(Radius.circular(30)),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey[500] ?? Colors.grey,
//                       offset: const Offset(4.0, 4.0),
//                       blurRadius: 2.0,
//                       spreadRadius: 1.0,
//                     ),
//                     const BoxShadow(
//                       color: Colors.white,
//                       offset: Offset(-4.0, 4.0),
//                       blurRadius: 2.0,
//                       spreadRadius: 1.0,
//                     ),
//                   ],
//                 ),
//                 child: Center(
//                   child: Text(buttonText,
//                     style: TextStyle(color: textColor, fontSize: 25)),
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }
