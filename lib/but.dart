import 'package:flutter/material.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as inset;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyButton(),
    );
  }
}

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isPressed = true;
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    Offset distance = isPressed ? const Offset(10, 10) : const Offset(28, 28);
    double blur = isPressed ? 5.0 : 3.0;
    // final backgroundColor =
    //     isDarkMode ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF);
    final backgroundColor =const Color(0xFFE7ECEF);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Listener(
          onPointerUp: (_) => setState(() => isPressed = false),
          onPointerDown: (_) => setState(() => isPressed = true),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: inset.BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFFE7ECEF),
              // color: isDarkMode
              //     ? const Color(0xFF2E3239)
              //     : const Color(0xFFE7ECEF),
              boxShadow: [
                inset.BoxShadow(
                  blurRadius: blur,
                  offset: -distance,
                  // color: isDarkMode ? Color(0xFF35393F) : Colors.white,
                  color:  Colors.white,
                  
                  inset: isPressed,
                ),
                inset.BoxShadow(
                  blurRadius: blur,
                  offset: distance,
                  // color: isDarkMode ? Color(0xFF23262A) : Color(0xFFA7A9AF),
                  color:  Color(0xFFA7A9AF),
                  inset: isPressed,
                ),
              ],
            ),
            child: const SizedBox(height: 200, width: 200),
          ),
        ),
      ),
    );
  }
}


// ...................BUTTON ONLY CODE..............//


// import 'package:flutter/material.dart';
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
//     as inset;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyButton(),
//     );
//   }
// }

// class MyButton extends StatefulWidget {
//   const MyButton({super.key});

//   @override
//   State<MyButton> createState() => _MyButtonState();
// }

// class _MyButtonState extends State<MyButton> {
//   bool isPressed = true;

//   @override
//   Widget build(BuildContext context) {
//     Offset distance = isPressed ? const Offset(10, 10) : const Offset(28, 28);
//     double blur = isPressed ? 5.0 : 30;

//     return Scaffold(
//       backgroundColor: const Color(0xFFE7ECEF),
//       body: Center(
//         child: GestureDetector(
//           onTap: () => setState(() => isPressed = !isPressed),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 100),
//             decoration: inset.BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: const Color(0xFFE7ECEF),
//               boxShadow: [
//                 inset.BoxShadow(
//                   blurRadius: blur,
//                   offset: -distance,
//                   color: Colors.white,
//                   inset: isPressed,
//                 ),
//                 inset.BoxShadow(
//                   blurRadius: blur,
//                   offset: distance,
//                   color: const Color(0xFFA7A9AF),
//                   inset: isPressed,
//                 ),
//               ],
//             ),
//             child: const SizedBox(height: 200, width: 200),
//           ),
//         ),
//       ),
//     );
//   }
// }
